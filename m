Content-Type: multipart/mixed; boundary="===============1835280974602345988=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [ti:ti-linux-5.4.y 1/1] net/hsr/hsr_forward.c:244:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute
Date: Mon, 12 Oct 2020 20:18:41 +0800
Message-ID: <20201012121841.GA24339@intel.com>
In-Reply-To: <6fa8a876-1ecf-3680-bb0f-654d6aea3157@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1835280974602345988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 07:17:52AM -0500, Dan Murphy wrote:
> Philip
> =

> On 10/12/20 7:12 AM, Philip Li wrote:
> > On Mon, Oct 12, 2020 at 08:08:18PM +0800, Philip Li wrote:
> > > On Mon, Oct 12, 2020 at 06:42:21AM -0500, Dan Murphy wrote:
> > > > Hello robot
> > > > =

> > > > On 10/10/20 2:07 AM, kernel test robot wrote:
> > > > > tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-l=
inux-5.4.y
> > > > Why is this TI tree being reported to the open source community? Th=
ey have
> > > hi Dan, thanks for the info, this is added automatically, we will
> > > disable the test of this repo. Sorry for any confusion.
> > oops, I understand the question wrongly. We will keep testing this repo.
> > The problem here is it is a clang build, and we currently cc clang mail=
ing list
> > in case there's doublt that this may be a clang prolem instead of kerne=
l. It
> > is not specially to whole opoen source community. Is this ok with you?
> =

> It is fine to keep testing the repo but the error reporting should go to =
TI
> not GKH. I am fairly certain he does not care about our tree.
yes, you are right, for this case, we should not send mail to GKH.

> =

> Not sure if there is intelligence in the bot to direct bug reports to
> specific companies or individuals when testing SoC product trees
Currently, we can do some static configuration per different needs.

Do you have any mailing list that you want to send report to/cc for this ti
repo? Or just send to you?

> =

> Dan
>=20
--===============1835280974602345988==--

