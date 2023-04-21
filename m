Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0802F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682078056; x=1713614056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YziT1pvEykaRTG6nPgbiqa88CJNuXV8lCRXWSw9sPo=;
  b=oEmyf6v92CaXI+K1kNA+hJYnGi0Gu8IUweY4xgB5hclmqD9PgY05EKI+
   XgCSsEcrD+JQ6ULRcn4jk4AimerBHQxQse0FEs9QVURSYzCELwu/NilTf
   p+o7XI6STc4Dl21kTO4wT9DMbk53oQfL1Ime1Dk83BL/CXz8tJ2w6nJMV
   8Zkc9yoK8Y2KiuKwTB46SgzyTxzTJieObYAlmip5jwDTHUkCgfONrRQqO
   NgG/nifdVpeIXnm0oe98OGdUL+yY1V9hDpqfBz6aUbOiFt2IKthPws66M
   GmVOkxnNv/D2eNjFsyioDPay3knOVQ176ApSDwrklJ5DbJZXp2sW2CJ0q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325575920"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325575920"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 04:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="781582335"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="781582335"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 04:54:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pppLA-000gYy-1v;
	Fri, 21 Apr 2023 11:54:12 +0000
Date: Fri, 21 Apr 2023 19:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Dominik Behr <dbehr@chromium.org>,
	=?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 855/9354]
 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:70:25: sparse:
 sparse: mixing different enum types:
Message-ID: <202304211939.XQyBTCUs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: 0b40bb2f8c89fb92e2d6abea00350f9c551da9d2 [855/9354] BACKPORT: drm/amd/dc: Add dc display driver (v2)
config: sparc64-randconfig-s053-20230416 (https://download.01.org/0day-ci/archive/20230421/202304211939.XQyBTCUs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/0b40bb2f8c89fb92e2d6abea00350f9c551da9d2
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout 0b40bb2f8c89fb92e2d6abea00350f9c551da9d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/gpu/drm/ drivers/mmc/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211939.XQyBTCUs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:70:25: sparse: sparse: mixing different enum types:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:70:25: sparse:    int enum dce_version
>> drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:70:25: sparse:    unsigned int enum dce_environment
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:76:25: sparse: sparse: mixing different enum types:
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:76:25: sparse:    int enum dce_version
   drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:76:25: sparse:    unsigned int enum dce_environment
   cc1: warning: ../display/: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: ../display/include: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:62:32: warning: 'dal_fixed31_32_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:61:32: warning: 'dal_fixed31_32_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:60:32: warning: 'dal_fixed31_32_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_e = { 11674931555LL };
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:59:32: warning: 'dal_fixed31_32_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:58:32: warning: 'dal_fixed31_32_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_pi = { 13493037705LL };
                                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:56:32: warning: 'dal_fixed31_32_one' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_one = { 0x100000000LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:55:32: warning: 'dal_fixed31_32_half' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_half = { 0x80000000LL };
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:54:32: warning: 'dal_fixed31_32_epsilon' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_epsilon = { 1LL };
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:53:32: warning: 'dal_fixed31_32_zero' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_zero = { 0 };
                                   ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:28:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed32_32.h:38:32: warning: 'dal_fixed32_32_half' defined but not used [-Wunused-const-variable=]
    static const struct fixed32_32 dal_fixed32_32_half = { 0x80000000LL };
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed32_32.h:37:32: warning: 'dal_fixed32_32_one' defined but not used [-Wunused-const-variable=]
    static const struct fixed32_32 dal_fixed32_32_one = { 0x100000000LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed32_32.h:36:32: warning: 'dal_fixed32_32_zero' defined but not used [-Wunused-const-variable=]
    static const struct fixed32_32 dal_fixed32_32_zero = { 0 };
                                   ^~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:552:31: sparse: sparse: mixing different enum types:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:552:31: sparse:    unsigned int enum dce_environment
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:552:31: sparse:    int enum dce_version
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:956:6: sparse: sparse: symbol 'pplib_apply_display_requirements' was not declared. Should it be static?
   cc1: warning: ../display/: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: ../display/include: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:27:0:
   drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:586:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct graphics_object_id dc_get_link_id_at_index(
    ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: In function 'dc_create':
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:631:45: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     if (core_dc->res_pool->underlay_pipe_index >= 0)
                                                ^~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c: At top level:
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:956:6: warning: no previous declaration for 'pplib_apply_display_requirements' [-Wmissing-declarations]
    void pplib_apply_display_requirements(
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1528:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct graphics_object_id dc_get_link_id_at_index(
    ^~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:31:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:186:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE5' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE5 =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:184:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE4' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE4 =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:182:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE3' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE3 =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:180:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE2' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE2 =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:178:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE1' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_LOW_BYTE1 =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:174:23: warning: 'DP_SINK_DEV_STRING_ID2_REV1_HW_ID_HIGH_BYTE' defined but not used [-Wunused-const-variable=]
    static const uint32_t DP_SINK_DEV_STRING_ID2_REV1_HW_ID_HIGH_BYTE =
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:168:22: warning: 'DP_SINK_DEV_STRING_ID2_REV0' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_SINK_DEV_STRING_ID2_REV0[] = "000000";
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:166:22: warning: 'DP_DVI_CONVERTER_ID_42' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_DVI_CONVERTER_ID_42[] = "v2DVIa";
                         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:164:22: warning: 'DP_DVI_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_DVI_CONVERTER_ID_4[] = "m2DVIa";
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:162:22: warning: 'DP_VGA_CONVERTER_ID_4' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_CONVERTER_ID_4[] = "DpVga";
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:160:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_3' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_LVDS_CONVERTER_ID_3[] = "dnomlA";
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:158:22: warning: 'DP_VGA_LVDS_CONVERTER_ID_2' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_LVDS_CONVERTER_ID_2[] = "sivarT";
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:156:22: warning: 'DP_DVI_CONVERTER_ID_1' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_DVI_CONVERTER_ID_1[] = "m2DVIa";
                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:154:22: warning: 'DP_VGA_CONVERTER_ID_1' defined but not used [-Wunused-const-variable=]
    static const uint8_t DP_VGA_CONVERTER_ID_1[] = "mVGAa";
                         ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:29:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:62:32: warning: 'dal_fixed31_32_ln2_div_2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_ln2_div_2 = { 1488522236LL };
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:61:32: warning: 'dal_fixed31_32_ln2' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_ln2 = { 2977044471LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:60:32: warning: 'dal_fixed31_32_e' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_e = { 11674931555LL };
                                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:59:32: warning: 'dal_fixed31_32_two_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_two_pi = { 26986075409LL };
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:58:32: warning: 'dal_fixed31_32_pi' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_pi = { 13493037705LL };
                                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:56:32: warning: 'dal_fixed31_32_one' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_one = { 0x100000000LL };
                                   ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:55:32: warning: 'dal_fixed31_32_half' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_half = { 0x80000000LL };
                                   ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:54:32: warning: 'dal_fixed31_32_epsilon' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_epsilon = { 1LL };
                                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed31_32.h:53:32: warning: 'dal_fixed31_32_zero' defined but not used [-Wunused-const-variable=]
    static const struct fixed31_32 dal_fixed31_32_zero = { 0 };
                                   ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:28:0,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:25:
   drivers/gpu/drm/amd/amdgpu/../display/include/fixed32_32.h:38:32: warning: 'dal_fixed32_32_half' defined but not used [-Wunused-const-variable=]
    static const struct fixed32_32 dal_fixed32_32_half = { 0x80000000LL };
                                   ^~~~~~~~~~~~~~~~~~~

vim +70 drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_service.c

    47	
    48	/*
    49	 * @brief
    50	 * Public API.
    51	 */
    52	
    53	struct gpio_service *dal_gpio_service_create(
    54		enum dce_version dce_version_major,
    55		enum dce_version dce_version_minor,
    56		struct dc_context *ctx)
    57	{
    58		struct gpio_service *service;
    59	
    60		uint32_t index_of_id;
    61	
    62		service = dm_alloc(sizeof(struct gpio_service));
    63	
    64		if (!service) {
    65			BREAK_TO_DEBUGGER();
    66			return NULL;
    67		}
    68	
    69		if (!dal_hw_translate_init(&service->translate, dce_version_major,
  > 70				dce_version_minor)) {
    71			BREAK_TO_DEBUGGER();
    72			goto failure_1;
    73		}
    74	
    75		if (!dal_hw_factory_init(&service->factory, dce_version_major,
    76				dce_version_minor)) {
    77			BREAK_TO_DEBUGGER();
    78			goto failure_1;
    79		}
    80	
    81		/* allocate and initialize business storage */
    82		{
    83			const uint32_t bits_per_uint = sizeof(uint32_t) << 3;
    84	
    85			index_of_id = 0;
    86			service->ctx = ctx;
    87	
    88			do {
    89				uint32_t number_of_bits =
    90					service->factory.number_of_pins[index_of_id];
    91	
    92				uint32_t number_of_uints =
    93					(number_of_bits + bits_per_uint - 1) /
    94					bits_per_uint;
    95	
    96				uint32_t *slot;
    97	
    98				if (number_of_bits) {
    99					uint32_t index_of_uint = 0;
   100	
   101					slot = dm_alloc(number_of_uints * sizeof(uint32_t));
   102	
   103					if (!slot) {
   104						BREAK_TO_DEBUGGER();
   105						goto failure_2;
   106					}
   107	
   108					do {
   109						slot[index_of_uint] = 0;
   110	
   111						++index_of_uint;
   112					} while (index_of_uint < number_of_uints);
   113				} else
   114					slot = NULL;
   115	
   116				service->busyness[index_of_id] = slot;
   117	
   118				++index_of_id;
   119			} while (index_of_id < GPIO_ID_COUNT);
   120		}
   121	
   122		return service;
   123	
   124	failure_2:
   125		while (index_of_id) {
   126			uint32_t *slot;
   127	
   128			--index_of_id;
   129	
   130			slot = service->busyness[index_of_id];
   131	
   132			if (slot)
   133				dm_free(slot);
   134		};
   135	
   136	failure_1:
   137		dm_free(service);
   138	
   139		return NULL;
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
