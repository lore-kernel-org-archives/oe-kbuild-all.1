Content-Type: multipart/mixed; boundary="===============4567816325518672435=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: fs/proc/task_nommu.c:67:55: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Mon, 25 May 2020 08:08:54 +0800
Message-ID: <20200525000854.GA29958@intel.com>
In-Reply-To: <20200524190415.zb5v5dlp6jxhb42y@ltop.local>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4567816325518672435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2020 at 09:04:15PM +0200, Luc Van Oostenryck wrote:
> Hi,
> =

> I'm wondering why Sparse error/warning messages are often subtly
> corrupted. For exemple:
> =

> > sparse warnings: (new ones prefixed by >>)
> > =

> > >> fs/proc/task_nommu.c:67:55: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected struct refcount_struct const=
 [usertype] *r @@    got sstruct refcount_struct const [usertype] *r @@
> =

> The ending part "got sstruct" is wrong, parse correctly emits "got struct=
".
> =

> > >> fs/proc/task_nommu.c:68:43: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const *objp @@    got s=
truct sighand_struct [noderevoid const *objp @@
> =

> It's wrong here too: "got struct sighand_struct [noderevoid const *objp"
> It looks like starting with the 'expected' part and ending with the 'got'=
 part.
> =

> It's not something new but I never bothered to repport.
> It only happens with the part prefixed by '>>', I've never seen this sort=
 of
> corruption in the other parts.
Thanks Luc for pointing out this, we will fix this in earliest time
to make report correct.

> =

> It's maybe related to some substitution that is made to replace ": warnin=
g:"
> or ": error:" by ": sparse:" but since the flag -fdiagnostic-prefix is us=
ed
> the result is the redundant ": sparse: sparse:". =

Thanks for the hint, we will check code logic.

> =

> Best regards,
> -- Luc Van Oostenryck (sparse's maintainer)
--===============4567816325518672435==--

