Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EF42772E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 23:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675639605; x=1707175605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHU9JZ5U9twsT6mjbtzanElC7vkblwyYpAuVPveGzrA=;
  b=YD/0tV522ZlAMY+wXwPUqwBFrBuxCacfSX0D8t9rUKdr+HIMw/PyKKZ0
   I2PotylS+HVfP1FaPx525MMwpwNesxbh7wgu9pO34g9cwSKArCew5X2jp
   ShBvbSP5pHljrhK6+4eztzCc3Crr7f1sNWs8MJXyuLhAVipZEFk3iCzdT
   AwDlS1ObOiqOP8b9vdw0HqB5eSeUXZax8EwUfVi8pg6WN7L1A0qy7JAwB
   ikeajgGeniKok/r16MnLCikkcCxz9wyNo3chCCVwcm3Dr/Nc4NuFXVwh8
   u/uNpiqP833BZxPUWTJLAYHSTukhbbrZNrtk8DTFpNuiLYmEvqLIFmvn6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309434123"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309434123"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 15:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="696700398"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="696700398"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Feb 2023 15:26:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOoP9-0002HU-0w;
	Sun, 05 Feb 2023 23:26:39 +0000
Date: Mon, 6 Feb 2023 07:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/media/virtio/virtio_video_device.c:504:29: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202302060727.KDiXmQ9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: b91d14b597929f638524030500519305aa4d6477 CHROMIUM: drivers: media: virtio: handle selection
date:   2 years, 2 months ago
config: m68k-randconfig-s051-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060727.KDiXmQ9y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=b91d14b597929f638524030500519305aa4d6477
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout b91d14b597929f638524030500519305aa4d6477
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_device.c:314:29: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:323:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:323:35: sparse:     expected unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:323:35: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:324:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:324:36: sparse:     expected unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:324:36: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:329:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_width @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:329:31: sparse:     expected unsigned int [usertype] min_width
   drivers/media/virtio/virtio_video_device.c:329:31: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:330:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_width @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:330:31: sparse:     expected unsigned int [usertype] max_width
   drivers/media/virtio/virtio_video_device.c:330:31: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:331:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] min_height @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:331:32: sparse:     expected unsigned int [usertype] min_height
   drivers/media/virtio/virtio_video_device.c:331:32: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:332:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] max_height @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:332:32: sparse:     expected unsigned int [usertype] max_height
   drivers/media/virtio/virtio_video_device.c:332:32: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:333:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_width @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:333:32: sparse:     expected unsigned int [usertype] step_width
   drivers/media/virtio/virtio_video_device.c:333:32: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:334:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] step_height @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:334:33: sparse:     expected unsigned int [usertype] step_height
   drivers/media/virtio/virtio_video_device.c:334:33: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:371:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:374:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:374:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:374:53: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:374:71: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:374:71: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:374:71: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:375:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:375:53: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:375:53: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:376:53: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] int_start @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:376:53: sparse:     expected unsigned int [usertype] int_start
   drivers/media/virtio/virtio_video_device.c:376:53: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:376:72: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] int_end @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:376:72: sparse:     expected unsigned int [usertype] int_end
   drivers/media/virtio/virtio_video_device.c:376:72: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:377:54: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] step @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:377:54: sparse:     expected unsigned int [usertype] step
   drivers/media/virtio/virtio_video_device.c:377:54: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:381:47: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:388:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:388:41: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:388:41: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:391:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:391:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:391:45: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:393:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:393:45: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:393:45: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:395:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] denominator @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:395:46: sparse:     expected unsigned int [usertype] denominator
   drivers/media/virtio/virtio_video_device.c:395:46: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:396:26: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_device.c:504:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] left @@     got restricted __le32 [usertype] left @@
   drivers/media/virtio/virtio_video_device.c:504:29: sparse:     expected signed int [usertype] left
   drivers/media/virtio/virtio_video_device.c:504:29: sparse:     got restricted __le32 [usertype] left
>> drivers/media/virtio/virtio_video_device.c:505:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] top @@     got restricted __le32 [usertype] top @@
   drivers/media/virtio/virtio_video_device.c:505:28: sparse:     expected signed int [usertype] top
   drivers/media/virtio/virtio_video_device.c:505:28: sparse:     got restricted __le32 [usertype] top
>> drivers/media/virtio/virtio_video_device.c:506:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] width @@     got restricted __le32 [usertype] width @@
   drivers/media/virtio/virtio_video_device.c:506:30: sparse:     expected unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:506:30: sparse:     got restricted __le32 [usertype] width
>> drivers/media/virtio/virtio_video_device.c:507:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] height @@     got restricted __le32 [usertype] height @@
   drivers/media/virtio/virtio_video_device.c:507:31: sparse:     expected unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:507:31: sparse:     got restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_device.c:527:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got signed int [usertype] top @@
   drivers/media/virtio/virtio_video_device.c:527:35: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_device.c:527:35: sparse:     got signed int [usertype] top
   drivers/media/virtio/virtio_video_device.c:528:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got signed int [usertype] left @@
   drivers/media/virtio/virtio_video_device.c:528:36: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_device.c:528:36: sparse:     got signed int [usertype] left
   drivers/media/virtio/virtio_video_device.c:529:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int [usertype] width @@
   drivers/media/virtio/virtio_video_device.c:529:37: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_device.c:529:37: sparse:     got unsigned int [usertype] width
   drivers/media/virtio/virtio_video_device.c:530:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int [usertype] height @@
   drivers/media/virtio/virtio_video_device.c:530:38: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_device.c:530:38: sparse:     got unsigned int [usertype] height
   drivers/media/virtio/virtio_video_device.c:578:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_device.c:581:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:581:47: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:581:47: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:582:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:582:47: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:582:47: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:585:48: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] min @@     got restricted __le32 [usertype] min @@
   drivers/media/virtio/virtio_video_device.c:585:48: sparse:     expected unsigned int [usertype] min
   drivers/media/virtio/virtio_video_device.c:585:48: sparse:     got restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_device.c:586:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] max @@     got restricted __le32 [usertype] max @@
   drivers/media/virtio/virtio_video_device.c:586:48: sparse:     expected unsigned int [usertype] max
   drivers/media/virtio/virtio_video_device.c:586:48: sparse:     got restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_device.c:593:64: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:593:64: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:593:64: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:596:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __le32 [usertype] step @@
   drivers/media/virtio/virtio_video_device.c:596:66: sparse:     expected unsigned int [usertype] a
   drivers/media/virtio/virtio_video_device.c:596:66: sparse:     got restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:606:33: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: incompatible types in comparison expression (different base types):
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    unsigned int *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse:    restricted __le32 *
   drivers/media/virtio/virtio_video_device.c:611:34: sparse: sparse: cast from unknown type
   drivers/media/virtio/virtio_video_device.c:898:70: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@

vim +504 drivers/media/virtio/virtio_video_device.c

   469	
   470	int virtio_video_g_selection(struct file *file, void *fh,
   471				 struct v4l2_selection *sel)
   472	{
   473		struct video_format_info *info = NULL;
   474		struct virtio_video_stream *stream = file2stream(file);
   475		struct virtio_video_device *vvd = video_drvdata(file);
   476	
   477		switch (vvd->type) {
   478		case VIRTIO_VIDEO_DEVICE_ENCODER:
   479			if (!V4L2_TYPE_IS_OUTPUT(sel->type))
   480				return -EINVAL;
   481			info = &stream->in_info;
   482			break;
   483		case VIRTIO_VIDEO_DEVICE_DECODER:
   484			if (V4L2_TYPE_IS_OUTPUT(sel->type))
   485				return -EINVAL;
   486			info = &stream->out_info;
   487			break;
   488		default:
   489			v4l2_err(&vvd->vv->v4l2_dev, "unsupported device type\n");
   490			return -EINVAL;
   491		}
   492	
   493		switch (sel->target) {
   494		case V4L2_SEL_TGT_CROP_BOUNDS:
   495			sel->r.width = info->frame_width;
   496			sel->r.height = info->frame_height;
   497			break;
   498		case V4L2_SEL_TGT_CROP_DEFAULT:
   499		case V4L2_SEL_TGT_CROP:
   500		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
   501		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
   502		case V4L2_SEL_TGT_COMPOSE:
   503		case V4L2_SEL_TGT_COMPOSE_PADDED:
 > 504			sel->r.left = info->crop.left;
 > 505			sel->r.top = info->crop.top;
 > 506			sel->r.width = info->crop.width;
 > 507			sel->r.height = info->crop.height;
   508			break;
   509		default:
   510			v4l2_dbg(1, vvd->vv->debug, &vvd->vv->v4l2_dev,
   511				 "unsupported/invalid selection target: %d\n",
   512				sel->target);
   513			return -EINVAL;
   514		}
   515	
   516		return 0;
   517	}
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
