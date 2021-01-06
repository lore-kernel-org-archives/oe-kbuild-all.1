Content-Type: multipart/mixed; boundary="===============2932271573285222090=="
MIME-Version: 1.0
From: Marek Behún <kabel@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [net-next PATCH v12 4/4] net: dsa: mv88e6xxx: Add support for mv88e6393x family of Marvell
Date: Wed, 06 Jan 2021 13:20:50 +0100
Message-ID: <20210106132050.4f0875c7@kernel.org>
In-Reply-To: <20210106004530.22197-1-pavana.sharma@digi.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2932271573285222090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed,  6 Jan 2021 10:45:30 +1000
Pavana Sharma <pavana.sharma@digi.com> wrote:

> Thanks Marek for catching this.
> =

> I will have a closer look and update the patchset.

I also sent a reply patch with subject
  "patch fixing mv88e6393x SERDES IRQ for Pavana's series"

it contains the changes necessary to your series. Please look at that.
You can apply it to your commit via
  patch -p1 <patch_from_marek.patch
  git commit --amend drivers/net/dsa/mv88e6xxx/{chip.c,serdes.c,serdes.h}

Marek
--===============2932271573285222090==--

