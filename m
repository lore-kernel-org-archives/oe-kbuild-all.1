Content-Type: multipart/mixed; boundary="===============9137686418463563847=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 5835/9999] arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous prototype for 'disable_err_thresholding'
Date: Thu, 21 Jan 2021 20:41:09 +0800
Message-ID: <20210121124109.GA13998@intel.com>
In-Reply-To: <20210121103908.GB28677@zn.tnic>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9137686418463563847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 11:39:08AM +0100, Borislav Petkov wrote:
> On Thu, Jan 21, 2021 at 05:38:55PM +0800, Rong Chen wrote:
> > Sorry for the noise, we'll disable W=3D1 for stable kernels firstly.
> =

> Well, this is the thing: W=3D1 might make sense *sometimes* because it
> enables a couple of warnings. One of them is -Wmissing-prototypes which
> doesn't make sense for stable, as explained earlier.
Thanks for the input, this helps and we can focus on this warning firstly
to reduce meaningless reports for stable.

> =

> So you need to either
> =

> * disable -Wmissing-prototypes only which means stable-specific patch
> and stable folks don't like that.
> =

> or
> =

> * analyze the reports *before* sending them out. You could simply not
> send reports which come solely from -Wmissing-prototypes warnings.
We will look into above 2 options to see which one is easiler to
fit what we have in place. Thanks for your suggestions.

> =

> or
> =

> * patch the stable tree locally with your own patch
> =

> or
> =

> * ...
> =

> It all depends on what is done easier in your infra.
> =

> HTH.
> =

> -- =

> Regards/Gruss,
>     Boris.
> =

> SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 368=
09, AG N=C3=BCrnberg
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============9137686418463563847==--

