Content-Type: multipart/mixed; boundary="===============2665399881900754218=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 11/19] x86/sev-es: Convert to insn_decode()
Date: Thu, 21 Jan 2021 17:58:45 +0100
Message-ID: <20210121165845.GD32060@zn.tnic>
In-Reply-To: <X+ouv0PN6dmva92i@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2665399881900754218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 11:15:11AM -0800, Sean Christopherson wrote:
> Alternatively, could the kernel case use insn_decode_regs()?  If
> vc_fetch_insn_kernel() were also modified to mirror insn_fetch_from_user(=
), the
> two code paths could be unified except for the the fetch and the PFEC.  E=
.g.

Personal Firearms Eligibility Check?

In any case, I prefer simple, easy to follow code at a quick glance.
Stuff like...

> =

> static int vc_fetch_insn_kernel(struct es_em_ctxt *ctxt,
> 				unsigned char *buffer)
> {
> 	if (copy_from_kernel_nofault(buffer, (unsigned char *)ctxt->regs->ip, MA=
X_INSN_SIZE))
> 		return 0;
> =

> 	return MAX_INSN_SIZE;
> }
> =

> static enum es_result vc_decode_insn(struct es_em_ctxt *ctxt)
> {
> 	char buffer[MAX_INSN_SIZE];
> 	int nbytes;
> =

> 	if (user_mode(ctxt->regs))
> 		nbytes =3D insn_fetch_from_user(ctxt->regs, buffer);
> 	else
> 		nbytes =3D vc_fetch_insn_kernel(ctxt, buffer);
> =

> 	if (!nbytes) {
> 		ctxt->fi.vector     =3D X86_TRAP_PF;
> 		ctxt->fi.error_code =3D X86_PF_INSTR;
> 		if (user_mode(ctxt->regs))

... this second repeated check here is not what I would call that.

But this is my personal preference only so it's up for a vote now.

:-)

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============2665399881900754218==--

