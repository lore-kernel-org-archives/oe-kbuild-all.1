Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CA9C2FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692035320; x=1723571320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h88/Ihpnt6lnJkFMg9e8BtCAGfQj0767FxoCw2cs9vg=;
  b=GigzG139Bj3hqonMDm4tq2qxRgw3RjF4z9gB6iBOz0J6Bbwthon+UIV7
   qeDJixTkK+AI3HnJ8o5EjKxxx3J6k0uamYtv53q3jRhaUwcpUYyoZBerW
   U+yvzPX3rTBOyncNdvJDjQN3bjgE62R4L8N1+IKBvxnzsCZGfnJeoYrPC
   bMPSCU5ZoG0gadhB/G0fafNZ49gc8GdDzACNDY4zhfGERlhjWK7KtYind
   bdX8hqMM0uFnNyiCHfq+JsI0aoysEnNXbBC/1XF4MxqLJMB2zwrQIHLBz
   zT1uxtRAujwIGRb88W+sddJgaPRfLdG5m8x8+lOVTr3Alyv7WOXSjfqYZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="371001960"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="371001960"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823544261"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823544261"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 10:48:38 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVbgD-0000KF-2X;
	Mon, 14 Aug 2023 17:48:37 +0000
Date: Tue, 15 Aug 2023 01:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Bandi, Kushal" <kushal.bandi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.14/base 6210/28962]
 drivers/media/platform/video-sensor-stub.c:82:31: warning:
 'sensor_supported_codes' defined but not used
Message-ID: <202308150130.ZD9DsLwt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.14/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: f2c4233e588a3be9b02b6858aeb0b2beb42df511 [6210/28962] pci:intel: Upgrading IPU to mr4_beta_20180506 FW release
config: i386-randconfig-r081-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150130.ZD9DsLwt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150130.ZD9DsLwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150130.ZD9DsLwt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/video-sensor-stub.c:124:32: sparse: sparse: undefined identifier 'v4l2_subdev_get_try_format'
   drivers/media/platform/video-sensor-stub.c:166:17: sparse: sparse: undefined identifier 'v4l2_subdev_get_try_format'
   drivers/media/platform/video-sensor-stub.c:290:50: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/platform/video-sensor-stub.c:304:41: sparse: sparse: no member 'entity' in struct v4l2_subdev
   drivers/media/platform/video-sensor-stub.c: In function '__stub_get_format':
   drivers/media/platform/video-sensor-stub.c:124:18: error: implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean 'v4l2_subdev_notify_event'? [-Werror=implicit-function-declaration]
      fmt->format = *v4l2_subdev_get_try_format(subdev,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     v4l2_subdev_notify_event
   drivers/media/platform/video-sensor-stub.c:124:17: error: invalid type argument of unary '*' (have 'int')
      fmt->format = *v4l2_subdev_get_try_format(subdev,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             cfg, fmt->pad);
             ~~~~~~~~~~~~~~
   drivers/media/platform/video-sensor-stub.c: In function 'stub_open':
   drivers/media/platform/video-sensor-stub.c:166:40: error: 'struct v4l2_subdev_fh' has no member named 'pad'
      v4l2_subdev_get_try_format(subdev, fh->pad, 0);
                                           ^~
   drivers/media/platform/video-sensor-stub.c: In function 'sensor_stub_probe':
   drivers/media/platform/video-sensor-stub.c:290:43: error: 'struct v4l2_subdev' has no member named 'entity'
     rval = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
                                              ^
   drivers/media/platform/video-sensor-stub.c: In function 'sensor_stub_remove':
   drivers/media/platform/video-sensor-stub.c:304:34: error: 'struct v4l2_subdev' has no member named 'entity'
     media_entity_cleanup(&sensor->sd.entity);
                                     ^
   At top level:
   drivers/media/platform/video-sensor-stub.c:245:35: warning: 'ipu_isys_sensor_ctrl_ops' defined but not used [-Wunused-const-variable=]
    static const struct v4l2_ctrl_ops ipu_isys_sensor_ctrl_ops = {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/video-sensor-stub.c:82:31: warning: 'sensor_supported_codes' defined but not used [-Wunused-const-variable=]
    static const uint32_t * const sensor_supported_codes[] = {
                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-sensor-stub.c:58:27: warning: 'pixel_order_str' defined but not used [-Wunused-const-variable=]
    static const char * const pixel_order_str[] = { "GRBG", "RGGB", "BGGR", "GBRG" };
                              ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/video-sensor-stub.c: In function '__stub_get_format':
   drivers/media/platform/video-sensor-stub.c:124:18: error: implicit declaration of function 'v4l2_subdev_get_try_format'; did you mean 'v4l2_subdev_notify_event'? [-Werror=implicit-function-declaration]
      fmt->format = *v4l2_subdev_get_try_format(subdev,
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     v4l2_subdev_notify_event
   drivers/media/platform/video-sensor-stub.c:124:17: error: invalid type argument of unary '*' (have 'int')
      fmt->format = *v4l2_subdev_get_try_format(subdev,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             cfg, fmt->pad);
             ~~~~~~~~~~~~~~
   drivers/media/platform/video-sensor-stub.c: In function 'stub_open':
   drivers/media/platform/video-sensor-stub.c:166:40: error: 'struct v4l2_subdev_fh' has no member named 'pad'
      v4l2_subdev_get_try_format(subdev, fh->pad, 0);
                                           ^~
   drivers/media/platform/video-sensor-stub.c: In function 'sensor_stub_probe':
   drivers/media/platform/video-sensor-stub.c:290:43: error: 'struct v4l2_subdev' has no member named 'entity'
     rval = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
                                              ^
   drivers/media/platform/video-sensor-stub.c: In function 'sensor_stub_remove':
   drivers/media/platform/video-sensor-stub.c:304:34: error: 'struct v4l2_subdev' has no member named 'entity'
     media_entity_cleanup(&sensor->sd.entity);
                                     ^
   At top level:
   drivers/media/platform/video-sensor-stub.c:245:35: warning: 'ipu_isys_sensor_ctrl_ops' defined but not used [-Wunused-const-variable=]
    static const struct v4l2_ctrl_ops ipu_isys_sensor_ctrl_ops = {
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/video-sensor-stub.c:82:31: warning: 'sensor_supported_codes' defined but not used [-Wunused-const-variable=]
    static const uint32_t * const sensor_supported_codes[] = {
                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/video-sensor-stub.c:58:27: warning: 'pixel_order_str' defined but not used [-Wunused-const-variable=]
    static const char * const pixel_order_str[] = { "GRBG", "RGGB", "BGGR", "GBRG" };
                              ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sensor_supported_codes +82 drivers/media/platform/video-sensor-stub.c

    80	
    81	
  > 82	static const uint32_t * const sensor_supported_codes[] = {
    83		sensor_supported_codes_pad,
    84	};
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
