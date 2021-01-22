Content-Type: multipart/mixed; boundary="===============3433483100319090052=="
MIME-Version: 1.0
From: Like Xu <like.xu@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] x86/perf: Use static_call for x86_pmu.guest_get_msrs
Date: Fri, 22 Jan 2021 11:19:31 +0800
Message-ID: <7f31ae2f-25a1-a7fb-1598-a8f21f3bc447@linux.intel.com>
In-Reply-To: <YAWOhxi6Vxiq8JLR@hirez.programming.kicks-ass.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3433483100319090052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/1/18 21:35, Peter Zijlstra wrote:
> On Mon, Jan 18, 2021 at 09:05:06PM +0800, Like Xu wrote:
>> I guess this fix will silence the compiler error,
>> and v2 will be sent after the local 0day test passes.
> =

> I think there's also a problem where you don't assign a function at all.

Thank you!

> =

> I think you want something like
> =

> 	if (!x86_pmu.guest_get_msr)
> 		x86_pmu.guest_get_msr =3D guest_get_msr_nop;
> =

> right before x86_pmu_static_call_update();
> =

> And then have it be something like:
> =

> static void *guest_et_msr_nop(int *nr)

The [-Werror=3Dincompatible-pointer-types] will yell at "void *".

Please review the v2 version.

https://lore.kernel.org/lkml/20210122030324.2754492-1-like.xu(a)linux.intel=
.com/T/#u

> {
> 	*nr =3D 0;
> 	return NULL;
> }
> =

> and then you can reduce the entire thing to:
> =

> struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr)
> {
> 	return static_call(x86_pmu_guest_get_msrs)(nr);
> }
>=20

--===============3433483100319090052==--

