Content-Type: multipart/mixed; boundary="===============4567791048312892930=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: kbuild-all@lists.01.org
Subject: Re: mm/migrate.c:1406:5: warning: stack frame size of 2096 bytes in function 'migrate_pages'
Date: Mon, 31 May 2021 15:14:12 -0700
Message-ID: <20210531151412.4dad38dd703119cdd33ca395@linux-foundation.org>
In-Reply-To: <202105301728.lr6r1Eyr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4567791048312892930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 30 May 2021 17:46:48 +0800 kernel test robot <lkp@intel.com> wrot=
e:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b90e90f40b4ff23c753126008bf4713a42353af6
> commit: dd4ae78a21fc05d91d841e499dddd057ad64a4df mm: migrate: simplify th=
e logic for handling permanent failure

migrate_pages() isn't a good place to be using lots of stack.  =


Am I correct in assuming that this is a bisection result?

I don't immediately see why dd4ae78a21fc05d91d would be the main cause
of this.


--===============4567791048312892930==--

