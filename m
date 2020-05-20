Content-Type: multipart/mixed; boundary="===============9139317393855905769=="
MIME-Version: 1.0
From: Martin K. Petersen <martin.petersen@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 156/523] include/linux/string.h:307:9: note: in expansion of macro '__underlying_strncpy'
Date: Tue, 19 May 2020 22:08:53 -0400
Message-ID: <yq17dx7wej4.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <20200519184847.5affb9238b7358ac0d18c98e@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9139317393855905769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Andrew,

> 		/* Vendor Identification */
>>>>		strncpy(&inqdata[16], "RAID controller ", 16);

> That strncpy() will indeed fail to copy the trailing null, but it looks
> like that null isn't appropriate in the inquiry data.

Correct. These protocol strings are fixed-length / space-padded.
I.e. not null-terminated.

-- =

Martin K. Petersen	Oracle Linux Engineering
--===============9139317393855905769==--

