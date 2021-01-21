Content-Type: multipart/mixed; boundary="===============6319591875919687872=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 5835/9999] arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous prototype for 'disable_err_thresholding'
Date: Thu, 21 Jan 2021 11:39:08 +0100
Message-ID: <20210121103908.GB28677@zn.tnic>
In-Reply-To: <03812967-a4d2-deb9-63e9-048333988778@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6319591875919687872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 05:38:55PM +0800, Rong Chen wrote:
> Sorry for the noise, we'll disable W=3D1 for stable kernels firstly.

Well, this is the thing: W=3D1 might make sense *sometimes* because it
enables a couple of warnings. One of them is -Wmissing-prototypes which
doesn't make sense for stable, as explained earlier.

So you need to either

* disable -Wmissing-prototypes only which means stable-specific patch
and stable folks don't like that.

or

* analyze the reports *before* sending them out. You could simply not
send reports which come solely from -Wmissing-prototypes warnings.

or

* patch the stable tree locally with your own patch

or

* ...

It all depends on what is done easier in your infra.

HTH.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imend=C3=B6rffer, HRB 36809=
, AG N=C3=BCrnberg
--===============6319591875919687872==--

