Content-Type: multipart/mixed; boundary="===============8537100865370622661=="
MIME-Version: 1.0
From: Anand Jain <anand.jain@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 2/5] btrfs: create read policy framework
Date: Wed, 19 Feb 2020 19:40:47 +0800
Message-ID: <c06da00e-2cb2-806a-f441-6d5a29c7293c@oracle.com>
In-Reply-To: <202002191535.zA4fBD3N%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8537100865370622661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


>     In file included from fs/btrfs/volumes.c:18:0:
>     fs/btrfs/volumes.c: In function 'find_live_mirror':

>>> fs/btrfs/ctree.h:3143:4: warning: this statement may fall through [-Wim=
plicit-fallthrough=3D]

  This is not a bug. May be we can make the robot happy.

Thanks, Anand
--===============8537100865370622661==--

