Content-Type: multipart/mixed; boundary="===============8657947321477710736=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/core 4/9] arch/x86/kernel/smpboot.c:2083: undefined reference to `__udivdi3'
Date: Tue, 19 May 2020 19:36:32 +0200
Message-ID: <20200519173632.GB317395@hirez.programming.kicks-ass.net>
In-Reply-To: <1589907000.13984.25.camel@suse.cz>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8657947321477710736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 06:50:00PM +0200, Giovanni Gherdovich wrote:
> On Mon, 2020-05-18 at 15:00 +0200, Peter Zijlstra wrote:

> > So far the easiest fix I've come up with is simply limiting all this to
> > 64bit.. like who cares about 32bit anyway :-))))
> =

> Agreed. I don't think APERFMPERF is supported on i386 anyways, and that w=
ould
> be a requirement for frequency invariance. In any case, support for i386 =
is
> "let's not break it".

Well, i386 is mostly a case of people running 32bit kernels on 64bit
capable hardware for $REASON. Which is stupid anyway. There is very few
actual 32bit chips left I think.

But I do think the very last 32bit CPUs did in fact support APERF/MPERF,
but meh.
--===============8657947321477710736==--

