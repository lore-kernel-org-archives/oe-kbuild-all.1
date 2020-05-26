Content-Type: multipart/mixed; boundary="===============1692718280716631254=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: kbuild-all@lists.01.org
Subject: Re: [dgc-xfs:xfs-async-inode-reclaim 28/30] fs/xfs/xfs_inode.c:3432:1: warning: no previous prototype for 'xfs_iflush'
Date: Wed, 27 May 2020 08:16:43 +1000
Message-ID: <20200526221643.GZ2040@dread.disaster.area>
In-Reply-To: <202005261941.GNNi105g%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1692718280716631254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 07:46:45PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git=
 xfs-async-inode-reclaim

Hiya kbuild robot!

Can you drop all the list cc's from build failures for this repo?
Nobody but me really needs to see all the breakage in this tree...

> :::::: The code at line 3432 was first introduced by commit
> :::::: 30ebf34422da6206608b0c6fba84b424f174b8c5 xfs: rename xfs_iflush_in=
t()
> =

> :::::: TO: Dave Chinner <dchinner@redhat.com>
> :::::: CC: Dave Chinner <david@fromorbit.com>

Also, I don't think this is doing what you expect, either, because
this build error was only sent to david(a)fromorbit.com and was not
CC'd to the author of the commit which is dchinner(a)redhat.com....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============1692718280716631254==--

