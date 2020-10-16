Content-Type: multipart/mixed; boundary="===============3722644239438062656=="
MIME-Version: 1.0
From: Jakub Kicinski <kuba@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net] net: dsa: point out the tail taggers
Date: Fri, 16 Oct 2020 15:56:32 -0700
Message-ID: <20201016155632.395af75a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201016213302.yeesw4jbw3rzfluf@skbuf>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3722644239438062656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Oct 2020 00:33:02 +0300 Vladimir Oltean wrote:
> On Sat, Oct 17, 2020 at 12:16:28AM +0300, Vladimir Oltean wrote:
> > On Fri, Oct 16, 2020 at 11:03:18PM +0200, Andrew Lunn wrote:  =

> > > 2ecbc1f684482b4ed52447a39903bd9b0f222898 does not have net-next, as
> > > far as i see,  =

> > =

> > Not sure what you mean by that.  =

> =

> Ah, I do understand what you mean now. In git, that is what I see as
> well. But in my cgit link, why would tail_tag be there?
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/tree/inclu=
de/net/dsa.h#n93?id=3D2ecbc1f684482b4ed52447a39903bd9b0f222898
> I think either cgit is plainly dumb at showing the kernel tree at a
> particular commit, or I'm plainly incapable of using it.

The link is bamboozled.

The #n93 needs to be after the ? parameters.

Like this:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/tree/include=
/net/dsa.h?id=3D2ecbc1f684482b4ed52447a39903bd9b0f222898#n86
--===============3722644239438062656==--

