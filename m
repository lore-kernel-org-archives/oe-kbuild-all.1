Content-Type: multipart/mixed; boundary="===============1290463476430843857=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 2/5] btrfs: create read policy framework
Date: Wed, 19 Feb 2020 13:35:54 +0100
Message-ID: <20200219123554.GW2902@suse.cz>
In-Reply-To: <c06da00e-2cb2-806a-f441-6d5a29c7293c@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1290463476430843857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 07:40:47PM +0800, Anand Jain wrote:
> =

> >     In file included from fs/btrfs/volumes.c:18:0:
> >     fs/btrfs/volumes.c: In function 'find_live_mirror':
> =

> >>> fs/btrfs/ctree.h:3143:4: warning: this statement may fall through [-W=
implicit-fallthrough=3D]
> =

>   This is not a bug. May be we can make the robot happy.

Since 5.5 all fall-trhough switch labels should be annotated properly.
--===============1290463476430843857==--

