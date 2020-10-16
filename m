Content-Type: multipart/mixed; boundary="===============6938785358436812702=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net] net: dsa: point out the tail taggers
Date: Fri, 16 Oct 2020 23:03:18 +0200
Message-ID: <20201016210318.GL139700@lunn.ch>
In-Reply-To: <20201016201930.2i2lw4aixklyg6j7@skbuf>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6938785358436812702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2020 at 11:19:30PM +0300, Vladimir Oltean wrote:
> On Fri, Oct 16, 2020 at 10:14:28PM +0200, Andrew Lunn wrote:
> > On Fri, Oct 16, 2020 at 08:33:17PM +0300, Vladimir Oltean wrote:
> > > On Sat, Oct 17, 2020 at 01:25:08AM +0800, kernel test robot wrote:
> > > > Hi Christian,
> > > >
> > > > Thank you for the patch! Yet something to improve:
> > > >
> > > > [auto build test ERROR on net/master]
> > > >
> > > > url:    https://github.com/0day-ci/linux/commits/Christian-Eggers/n=
et-dsa-point-out-the-tail-taggers/20201017-003007
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.g=
it 2ecbc1f684482b4ed52447a39903bd9b0f222898
> > =

> > > Is the test bot being a bit "slow" today?
> > =

> > It is using the net.git commit from yesterday afternoon. net-next got
> > merged into net yesterday evening, so it is a bit behind, but not too
> > far behind.
> =

> Exactly. The sha1sum it uses _does_ contain the tail_tag member inside
> struct dsa_device_ops. What's it complaining about?

2ecbc1f684482b4ed52447a39903bd9b0f222898 does not have net-next, as
far as i see, and tail_tag only hit net when net-next was merged into
net.

Or i'm reading the git history wrong.

	Andrew
--===============6938785358436812702==--

