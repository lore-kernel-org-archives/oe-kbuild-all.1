Content-Type: multipart/mixed; boundary="===============3639509850836459602=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [dgc-xfs:xfs-async-inode-reclaim 28/30] fs/xfs/xfs_inode.c:3432:1: warning: no previous prototype for 'xfs_iflush'
Date: Thu, 28 May 2020 16:51:34 +0800
Message-ID: <a044ccc9-d83b-8a96-81b5-9aaad952387f@intel.com>
In-Reply-To: <20200526221643.GZ2040@dread.disaster.area>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3639509850836459602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/27/20 6:16 AM, Dave Chinner wrote:
> On Tue, May 26, 2020 at 07:46:45PM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.gi=
t xfs-async-inode-reclaim
> Hiya kbuild robot!
>
> Can you drop all the list cc's from build failures for this repo?
> Nobody but me really needs to see all the breakage in this tree...

Hi Dave,

Thanks for the feedback, we have marked the repo as private: =

https://github.com/intel/lkp-tests/blob/master/repo/linux/dgc-xfs

>
>> :::::: The code at line 3432 was first introduced by commit
>> :::::: 30ebf34422da6206608b0c6fba84b424f174b8c5 xfs: rename xfs_iflush_i=
nt()
>>
>> :::::: TO: Dave Chinner <dchinner@redhat.com>
>> :::::: CC: Dave Chinner <david@fromorbit.com>
> Also, I don't think this is doing what you expect, either, because
> this build error was only sent to david(a)fromorbit.com and was not
> CC'd to the author of the commit which is dchinner(a)redhat.com....

We have fixed it to avoid force changing "Dave Chinner" to "Dave Chinner =

<david@fromorbit.com>".

Best Regards,
Rong Chen

>
> Cheers,
>
> Dave.

--===============3639509850836459602==--

