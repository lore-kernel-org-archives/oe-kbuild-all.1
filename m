Content-Type: multipart/mixed; boundary="===============0455832371212223157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [dynticks:preempt/dynamic-v4 2/8] sound/core/./pcm_param_trace.h:29:126: warning: parameter names (without types) in function declaration
Date: Tue, 19 Jan 2021 02:19:34 +0800
Message-ID: <202101190228.whNSYLND-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0455832371212223157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynt=
icks.git preempt/dynamic-v4
head:   b5f3b1da9df4197d0b0ffe0f55f0f6a8c838d75f
commit: 01cd8f7be968649901ff73c706589bfb4a286365 [2/8] static_call: Provide=
 DEFINE_STATIC_CALL_RET0()
config: i386-randconfig-a014-20210118 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dy=
nticks.git/commit/?id=3D01cd8f7be968649901ff73c706589bfb4a286365
        git remote add dynticks https://git.kernel.org/pub/scm/linux/kernel=
/git/frederic/linux-dynticks.git
        git fetch --no-tags dynticks preempt/dynamic-v4
        git checkout 01cd8f7be968649901ff73c706589bfb4a286365
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/tracepoint.h:22,
                    from sound/core/pcm_param_trace.h:8,
                    from sound/core/pcm_native.c:32:
   include/linux/static_call.h:198:42: error: expected ',' or ')', found "_=
func_init"
     198 | #define __DEFINE_STATIC_CALL(name, _func _func_init)   \
         |                                          ^~~~~~~~~~
   include/linux/static_call.h:301:2: warning: data definition has no type =
or storage class
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   sound/core/./pcm_param_trace.h:28:1: note: in expansion of macro 'TRACE_=
EVENT'
      28 | TRACE_EVENT(hw_mask_param,
         | ^~~~~~~~~~~
   include/linux/static_call.h:301:2: error: type defaults to 'int' in decl=
aration of '__DEFINE_STATIC_CALL' [-Werror=3Dimplicit-int]
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   sound/core/./pcm_param_trace.h:28:1: note: in expansion of macro 'TRACE_=
EVENT'
      28 | TRACE_EVENT(hw_mask_param,
         | ^~~~~~~~~~~
   In file included from sound/core/pcm_param_trace.h:8,
                    from sound/core/pcm_native.c:32:
>> sound/core/./pcm_param_trace.h:29:126: warning: parameter names (without=
 types) in function declaration
      29 |  TP_PROTO(struct snd_pcm_substream *substream, snd_pcm_hw_param_=
t type, int index, const struct snd_mask *prev, const struct snd_mask *curr=
),
         |                                                                 =
                                                             ^~~~~~~~
   include/linux/tracepoint.h:313:22: note: in definition of macro 'DEFINE_=
TRACE_FN'
     313 |    ((void(*)(void *, proto))(it_func))(__data, args); \
         |                      ^~~~~
   include/linux/tracepoint.h:320:36: note: in expansion of macro 'PARAMS'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                    ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                     ^~~~~~
   sound/core/./pcm_param_trace.h:28:1: note: in expansion of macro 'TRACE_=
EVENT'
      28 | TRACE_EVENT(hw_mask_param,
         | ^~~~~~~~~~~
   sound/core/./pcm_param_trace.h:29:2: note: in expansion of macro 'TP_PRO=
TO'
      29 |  TP_PROTO(struct snd_pcm_substream *substream, snd_pcm_hw_param_=
t type, int index, const struct snd_mask *prev, const struct snd_mask *curr=
),
         |  ^~~~~~~~
   In file included from include/linux/tracepoint.h:22,
                    from sound/core/pcm_param_trace.h:8,
                    from sound/core/pcm_native.c:32:
   include/linux/static_call.h:301:2: warning: data definition has no type =
or storage class
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   sound/core/./pcm_param_trace.h:68:1: note: in expansion of macro 'TRACE_=
EVENT'
      68 | TRACE_EVENT(hw_interval_param,
         | ^~~~~~~~~~~
   include/linux/static_call.h:301:2: error: type defaults to 'int' in decl=
aration of '__DEFINE_STATIC_CALL' [-Werror=3Dimplicit-int]
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   sound/core/./pcm_param_trace.h:68:1: note: in expansion of macro 'TRACE_=
EVENT'
      68 | TRACE_EVENT(hw_interval_param,
         | ^~~~~~~~~~~
   In file included from sound/core/pcm_param_trace.h:8,
                    from sound/core/pcm_native.c:32:
   sound/core/./pcm_param_trace.h:69:130: warning: parameter names (without=
 types) in function declaration
      69 |  TP_PROTO(struct snd_pcm_substream *substream, snd_pcm_hw_param_=
t type, int index, const struct snd_interval *prev, const struct snd_interv=
al *curr),
         |                                                                 =
                                                                 ^~~~~~~~~~=
~~
   include/linux/tracepoint.h:313:22: note: in definition of macro 'DEFINE_=
TRACE_FN'
     313 |    ((void(*)(void *, proto))(it_func))(__data, args); \
         |                      ^~~~~
   include/linux/tracepoint.h:320:36: note: in expansion of macro 'PARAMS'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                    ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                     ^~~~~~
   sound/core/./pcm_param_trace.h:68:1: note: in expansion of macro 'TRACE_=
EVENT'
      68 | TRACE_EVENT(hw_interval_param,
         | ^~~~~~~~~~~
   sound/core/./pcm_param_trace.h:69:2: note: in expansion of macro 'TP_PRO=
TO'
      69 |  TP_PROTO(struct snd_pcm_substream *substream, snd_pcm_hw_param_=
t type, int index, const struct snd_interval *prev, const struct snd_interv=
al *curr),
         |  ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/tracepoint.h:22,
                    from drivers/gpu/drm/radeon/radeon_trace.h:6,
                    from drivers/gpu/drm/radeon/radeon_trace_points.c:10:
   include/linux/static_call.h:198:42: error: expected ',' or ')', found "_=
func_init"
     198 | #define __DEFINE_STATIC_CALL(name, _func _func_init)   \
         |                                          ^~~~~~~~~~
   include/linux/static_call.h:301:2: warning: data definition has no type =
or storage class
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:15:1: note: in=
 expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(radeon_bo_create,
         | ^~~~~~~~~~~
   include/linux/static_call.h:301:2: error: type defaults to 'int' in decl=
aration of '__DEFINE_STATIC_CALL' [-Werror=3Dimplicit-int]
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:15:1: note: in=
 expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(radeon_bo_create,
         | ^~~~~~~~~~~
   In file included from drivers/gpu/drm/radeon/radeon_trace.h:6,
                    from drivers/gpu/drm/radeon/radeon_trace_points.c:10:
>> include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:16:22: warning=
: parameter names (without types) in function declaration
      16 |      TP_PROTO(struct radeon_bo *bo),
         |                      ^~~~~~~~~
   include/linux/tracepoint.h:313:22: note: in definition of macro 'DEFINE_=
TRACE_FN'
     313 |    ((void(*)(void *, proto))(it_func))(__data, args); \
         |                      ^~~~~
   include/linux/tracepoint.h:320:36: note: in expansion of macro 'PARAMS'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                    ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                     ^~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:15:1: note: in=
 expansion of macro 'TRACE_EVENT'
      15 | TRACE_EVENT(radeon_bo_create,
         | ^~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:16:6: note: in=
 expansion of macro 'TP_PROTO'
      16 |      TP_PROTO(struct radeon_bo *bo),
         |      ^~~~~~~~
   In file included from include/linux/tracepoint.h:22,
                    from drivers/gpu/drm/radeon/radeon_trace.h:6,
                    from drivers/gpu/drm/radeon/radeon_trace_points.c:10:
   include/linux/static_call.h:301:2: warning: data definition has no type =
or storage class
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:30:1: note: in=
 expansion of macro 'TRACE_EVENT'
      30 | TRACE_EVENT(radeon_cs,
         | ^~~~~~~~~~~
   include/linux/static_call.h:301:2: error: type defaults to 'int' in decl=
aration of '__DEFINE_STATIC_CALL' [-Werror=3Dimplicit-int]
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:30:1: note: in=
 expansion of macro 'TRACE_EVENT'
      30 | TRACE_EVENT(radeon_cs,
         | ^~~~~~~~~~~
   In file included from drivers/gpu/drm/radeon/radeon_trace.h:6,
                    from drivers/gpu/drm/radeon/radeon_trace_points.c:10:
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:31:22: warning=
: parameter names (without types) in function declaration
      31 |      TP_PROTO(struct radeon_cs_parser *p),
         |                      ^~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:313:22: note: in definition of macro 'DEFINE_=
TRACE_FN'
     313 |    ((void(*)(void *, proto))(it_func))(__data, args); \
         |                      ^~~~~
   include/linux/tracepoint.h:320:36: note: in expansion of macro 'PARAMS'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                    ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                     ^~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:30:1: note: in=
 expansion of macro 'TRACE_EVENT'
      30 | TRACE_EVENT(radeon_cs,
         | ^~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:31:6: note: in=
 expansion of macro 'TP_PROTO'
      31 |      TP_PROTO(struct radeon_cs_parser *p),
         |      ^~~~~~~~
   In file included from include/linux/tracepoint.h:22,
                    from drivers/gpu/drm/radeon/radeon_trace.h:6,
                    from drivers/gpu/drm/radeon/radeon_trace_points.c:10:
   include/linux/static_call.h:301:2: warning: data definition has no type =
or storage class
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:2: note: in expansion of macro 'DEFINE_TR=
ACE_FN'
     320 |  DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_T=
RACE'
      28 |  DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~
   include/trace/../../drivers/gpu/drm/radeon/radeon_trace.h:50:1: note: in=
 expansion of macro 'TRACE_EVENT'
      50 | TRACE_EVENT(radeon_vm_grab_id,
         | ^~~~~~~~~~~
   include/linux/static_call.h:301:2: error: type defaults to 'int' in decl=
aration of '__DEFINE_STATIC_CALL' [-Werror=3Dimplicit-int]
     301 |  __DEFINE_STATIC_CALL(name, _func, _func)
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:2: note: in expansion of macro 'DEFINE_ST=
ATIC_CALL'
     317 |  DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |  ^~~~~~~~~~~~~~~~~~


vim +29 sound/core/./pcm_param_trace.h

be4e31dab0e14c1f Takashi Sakamoto 2017-06-07   9  =

be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  10  #define HW_PARAM_ENTRY(pa=
ram) {SNDRV_PCM_HW_PARAM_##param, #param}
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  11  #define hw_param_labels		=
	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  12  	HW_PARAM_ENTRY(ACCESS),	=
	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  13  	HW_PARAM_ENTRY(FORMAT),	=
	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  14  	HW_PARAM_ENTRY(SUBFORMAT=
),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  15  	HW_PARAM_ENTRY(SAMPLE_BI=
TS),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  16  	HW_PARAM_ENTRY(FRAME_BIT=
S),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  17  	HW_PARAM_ENTRY(CHANNELS)=
,	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  18  	HW_PARAM_ENTRY(RATE),		\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  19  	HW_PARAM_ENTRY(PERIOD_TI=
ME),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  20  	HW_PARAM_ENTRY(PERIOD_SI=
ZE),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  21  	HW_PARAM_ENTRY(PERIOD_BY=
TES),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  22  	HW_PARAM_ENTRY(PERIODS),=
	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  23  	HW_PARAM_ENTRY(BUFFER_TI=
ME),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  24  	HW_PARAM_ENTRY(BUFFER_SI=
ZE),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  25  	HW_PARAM_ENTRY(BUFFER_BY=
TES),	\
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  26  	HW_PARAM_ENTRY(TICK_TIME)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  27  =

be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  28  TRACE_EVENT(hw_mask_param,
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07 @29  	TP_PROTO(struct snd_pcm_=
substream *substream, snd_pcm_hw_param_t type, int index, const struct snd_=
mask *prev, const struct snd_mask *curr),
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  30  	TP_ARGS(substream, type,=
 index, prev, curr),
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  31  	TP_STRUCT__entry(
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  32  		__field(int, card)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  33  		__field(int, device)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  34  		__field(int, subdevice)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  35  		__field(int, direction)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  36  		__field(snd_pcm_hw_para=
m_t, type)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  37  		__field(int, index)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  38  		__field(int, total)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  39  		__array(__u32, prev_bit=
s, 8)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  40  		__array(__u32, curr_bit=
s, 8)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  41  	),
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  42  	TP_fast_assign(
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  43  		__entry->card =3D subst=
ream->pcm->card->number;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  44  		__entry->device =3D sub=
stream->pcm->device;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  45  		__entry->subdevice =3D =
substream->number;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  46  		__entry->direction =3D =
substream->stream;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  47  		__entry->type =3D type;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  48  		__entry->index =3D inde=
x;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  49  		__entry->total =3D subs=
tream->runtime->hw_constraints.rules_num;
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  50  		memcpy(__entry->prev_bi=
ts, prev->bits, sizeof(__u32) * 8);
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  51  		memcpy(__entry->curr_bi=
ts, curr->bits, sizeof(__u32) * 8);
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  52  	),
6baca010c71176f4 Takashi Sakamoto 2017-06-09  53  	TP_printk("pcmC%dD%d%s:%=
d %03d/%03d %s %08x%08x%08x%08x %08x%08x%08x%08x",
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  54  		  __entry->card,
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  55  		  __entry->device,
6baca010c71176f4 Takashi Sakamoto 2017-06-09  56  		  __entry->direction ? =
"c" : "p",
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  57  		  __entry->subdevice,
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  58  		  __entry->index,
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  59  		  __entry->total,
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  60  		  __print_symbolic(__en=
try->type, hw_param_labels),
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  61  		  __entry->prev_bits[3]=
, __entry->prev_bits[2],
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  62  		  __entry->prev_bits[1]=
, __entry->prev_bits[0],
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  63  		  __entry->curr_bits[3]=
, __entry->curr_bits[2],
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  64  		  __entry->curr_bits[1]=
, __entry->curr_bits[0]
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  65  	)
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  66  );
be4e31dab0e14c1f Takashi Sakamoto 2017-06-07  67  =


:::::: The code at line 29 was first introduced by commit
:::::: be4e31dab0e14c1f6fa5c03b33056058b93316e2 ALSA: pcm: tracepoints for =
refining PCM parameters

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0455832371212223157==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0455832371212223157==--

