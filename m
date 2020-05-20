Content-Type: multipart/mixed; boundary="===============6913000700052701914=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/mm 1/23] arch/x86/mm/init.c:75:6: warning: no previous prototype for function 'x86_has_pat_wp'
Date: Wed, 20 May 2020 19:19:22 +0200
Message-ID: <20200520171922.GH1457@zn.tnic>
In-Reply-To: <CAKwvOdkPW2p-4fDUNT6so3DrxiJgtUNEFPJcHNf7VROozc4wjQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6913000700052701914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 06:07:14PM -0700, Nick Desaulniers wrote:
> It may be time to consider "promoting" some warnings from W=3D1 to be on
> by default.

That's the end goal with -Wmissing-prototypes for arch/x86/ at least.
We'll turn that on once all current warnings are fixed and won't allow
any more patches with it.

This is where the 0day bot would help with testing this but it really
should say that it is a W=3D1 build and should tone down the message
frequency as we're still very noisy.

Thx.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============6913000700052701914==--

