Content-Type: multipart/mixed; boundary="===============4598191121040013887=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] x86/perf: Use static_call for x86_pmu.guest_get_msrs
Date: Mon, 18 Jan 2021 14:35:03 +0100
Message-ID: <YAWOhxi6Vxiq8JLR@hirez.programming.kicks-ass.net>
In-Reply-To: <a82754e7-9a2d-7ab4-466d-fc0d51a3b7f2@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4598191121040013887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 09:05:06PM +0800, Like Xu wrote:
> I guess this fix will silence the compiler error,
> and v2 will be sent after the local 0day test passes.

I think there's also a problem where you don't assign a function at all.

I think you want something like

	if (!x86_pmu.guest_get_msr)
		x86_pmu.guest_get_msr =3D guest_get_msr_nop;

right before x86_pmu_static_call_update();

And then have it be something like:

static void *guest_et_msr_nop(int *nr)
{
	*nr =3D 0;
	return NULL;
}

and then you can reduce the entire thing to:

struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr)
{
	return static_call(x86_pmu_guest_get_msrs)(nr);
}
--===============4598191121040013887==--

