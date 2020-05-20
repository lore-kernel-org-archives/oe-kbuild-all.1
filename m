Content-Type: multipart/mixed; boundary="===============2626508003741396100=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 156/523] include/linux/string.h:307:9: note: in expansion of macro '__underlying_strncpy'
Date: Tue, 19 May 2020 18:48:47 -0700
Message-ID: <20200519184847.5affb9238b7358ac0d18c98e@linux-foundation.org>
In-Reply-To: <87blmkhtpy.fsf@dja-thinkpad.axtens.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2626508003741396100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2020 00:42:17 +1000 Daniel Axtens <dja@axtens.net> wrote:

> This looks like a SCSI issue that this has just happened to expose?
> + scsi list

Maybe.

static void arcmsr_handle_virtual_command(struct AdapterControlBlock *acb,
		struct scsi_cmnd *cmd)
{
	switch (cmd->cmnd[0]) {
	case INQUIRY: {
		unsigned char inqdata[36];
		char *buffer;
		struct scatterlist *sg;

		if (cmd->device->lun) {
			cmd->result =3D (DID_TIME_OUT << 16);
			cmd->scsi_done(cmd);
			return;
		}
		inqdata[0] =3D TYPE_PROCESSOR;
		/* Periph Qualifier & Periph Dev Type */
		inqdata[1] =3D 0;
		/* rem media bit & Dev Type Modifier */
		inqdata[2] =3D 0;
		/* ISO, ECMA, & ANSI versions */
		inqdata[4] =3D 31;
		/* length of additional data */
		strncpy(&inqdata[8], "Areca   ", 8);
		/* Vendor Identification */
>>>		strncpy(&inqdata[16], "RAID controller ", 16);
		/* Product Identification */
		strncpy(&inqdata[32], "R001", 4); /* Product Revision */

		sg =3D scsi_sglist(cmd);
		buffer =3D kmap_atomic(sg_page(sg)) + sg->offset;

		memcpy(buffer, inqdata, sizeof(inqdata));
		sg =3D scsi_sglist(cmd);
		kunmap_atomic(buffer - sg->offset);

		cmd->scsi_done(cmd);
	}
	break;

That strncpy() will indeed fail to copy the trailing null, but it looks
like that null isn't appropriate in the inquiry data.

So I suspect this is a valid usage of strncpy() and the checking is
just too strict.

otoh if this is the only place where we hit this issue then perhaps we
can switch to memcpy() and get on with life ;)

--===============2626508003741396100==--

