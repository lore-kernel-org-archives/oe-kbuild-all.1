Content-Type: multipart/mixed; boundary="===============8444470443083974358=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Date: Wed, 14 Oct 2020 13:16:46 +0300
Message-ID: <20201014101646.GV4077@smile.fi.intel.com>
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525B1294238@MBS07.vivotek.tw>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8444470443083974358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 09:58:54AM +0000, Michael.Wu(a)vatics.com wrote:
> On 10/14/20 4:53 PM, andriy.shevchenko(a)linux.intel.com wrote:
> > =

> > Wondering if you compile this at all...
> =

> =

> I'm very sorry that I did not compile it because I only have ARM SoC with=
 my
> linux 4.9.170, but I've verified the logic of this patch in my linux.
> =

> I'll correct these two syntax errors in next version. The reported
> warnings occurs from drivers/i2c/busses/i2c-designware-slave.c:13 seems
> not made by this modification. Please correct me if I'm wrong....

So, you have a chance to create a follow up patch to fix the warnings. :-)

-- =

With Best Regards,
Andy Shevchenko


--===============8444470443083974358==--

