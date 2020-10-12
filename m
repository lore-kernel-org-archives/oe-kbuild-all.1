Content-Type: multipart/mixed; boundary="===============3895343948848772619=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [ti:ti-linux-5.4.y 1/1] net/hsr/hsr_forward.c:244:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute
Date: Mon, 12 Oct 2020 20:12:04 +0800
Message-ID: <20201012121204.GC23489@intel.com>
In-Reply-To: <20201012120818.GB23489@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3895343948848772619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 08:08:18PM +0800, Philip Li wrote:
> On Mon, Oct 12, 2020 at 06:42:21AM -0500, Dan Murphy wrote:
> > Hello robot
> > =

> > On 10/10/20 2:07 AM, kernel test robot wrote:
> > > tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux=
-5.4.y
> > =

> > Why is this TI tree being reported to the open source community? They h=
ave
> hi Dan, thanks for the info, this is added automatically, we will
> disable the test of this repo. Sorry for any confusion.
oops, I understand the question wrongly. We will keep testing this repo.

The problem here is it is a clang build, and we currently cc clang mailing =
list
in case there's doublt that this may be a clang prolem instead of kernel. It
is not specially to whole opoen source community. Is this ok with you?

Thanks

> =

> > no interest in our product tree unless this same bug is in the mainline=
 or
> > Linux stable
> > =

> > Dan
> > =

> > _______________________________________________
> > kbuild-all mailing list -- kbuild-all(a)lists.01.org
> > To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============3895343948848772619==--

