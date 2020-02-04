Content-Type: multipart/mixed; boundary="===============6515862511868333076=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/4] tracing: Consolidate some synth_event_trace code
Date: Tue, 04 Feb 2020 18:00:55 +0800
Message-ID: <202002041727.A2Sm9Dd4%lkp@intel.com>
In-Reply-To: <d1c8d8ad124a653b7543afe801d38c199ca5c20e.1580506712.git.zanussi@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6515862511868333076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200131]
[cannot apply to tip/perf/core trace/for-next linux/master linus/master v5.=
5 v5.5-rc7 v5.5-rc6 v5.5]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Tom-Zanussi/tracing-Update=
s-to-dynamic-event-API/20200203-081520
base:    c8e31a0fc39797784e4b9acae3bd2e0c7bade36e
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-154-g1dc00f87-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
   kernel/trace/trace_events_hist.c:860:29: sparse: sparse: cast from restr=
icted gfp_t
>> kernel/trace/trace_events_hist.c:2066:5: sparse: sparse: symbol '__synth=
_event_add_val' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============6515862511868333076==--

