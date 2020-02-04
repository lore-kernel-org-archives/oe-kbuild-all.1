Content-Type: multipart/mixed; boundary="===============4090238176961485034=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-rt-devel:linux-5.4.y-rt-rebase 113/253] mm/swap.c:348:9: sparse: sparse: context imbalance in 'rotate_reclaimable_page' - different lock contexts for basic block
Date: Tue, 04 Feb 2020 12:29:35 +0100
Message-ID: <20200204112935.rq4yn7eh55paqwyw@linutronix.de>
In-Reply-To: <202001281808.IYdufgjo%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4090238176961485034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-01-28 18:26:57 [+0800], kbuild test robot wrote:
=E2=80=A6
> sparse warnings: (new ones prefixed by >>)
> =

>    include/linux/spinlock.h:393:9: sparse: sparse: context imbalance in '=
pagevec_lru_move_fn' - unexpected unlock

This looks okay and is the same as upstream. The unlock only happens if
`pgdat' if set and this happens only in the for-loop.

> >> mm/swap.c:348:9: sparse: sparse: context imbalance in 'rotate_reclaima=
ble_page' - different lock contexts for basic block
> >> mm/swap.c:440:13: sparse: sparse: context imbalance in '__lru_cache_ac=
tivate_page' - different lock contexts for basic block
> >> mm/swap.c:505:13: sparse: sparse: context imbalance in '__lru_cache_ad=
d' - different lock contexts for basic block
> >> mm/swap.c:695:6: sparse: sparse: context imbalance in 'lru_add_drain_c=
pu' - different lock contexts for basic block
> >> mm/swap.c:743:6: sparse: sparse: context imbalance in 'deactivate_file=
_page' - different lock contexts for basic block
> >> mm/swap.c:775:9: sparse: sparse: context imbalance in 'deactivate_page=
' - different lock contexts for basic block
> >> mm/swap.c:801:9: sparse: sparse: context imbalance in 'mark_page_lazyf=
ree' - different lock contexts for basic block

those look okay, took. The lock part deferences a per-CPU variable and
the local pointer is returned. The unlock part uses the local pointer.
This and the `if' (locked vs preempt-disable mode) might confuse sparse.

Sebastian
--===============4090238176961485034==--

