Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0147492
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 01:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720144265; cv=none; b=Dp4N168g03nOrN5o2zCs2VU9Zt+DvkuqpcBycz2M81WDrCiTB+lo1/vdCnwN19vXYAIpMU8D9e8AuvrwfXdf4IW55+XjL4nteCvTbyCqd0IcMWiXS5+mNi7lkK2o/t2UOl90WnhKB6cSAFY1Nerxi7I0fUbSfFtUaz0g2wgxAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720144265; c=relaxed/simple;
	bh=xMNQCMUasj9tQHcdD7prnOJnYW+rkhCcpdiAygtBuhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePxGtHlWXFRzQRrdpGCOFx5CaFcmT18CVuTnjEvUms8AD6BTo+YDSvcipfcksK/p94zGGAXWeo799UobSpp54cOUjhKhq9O0VHlMLm6kuoAVeURMJtqXnBoPmHcR/CqioM73FduVHbe8/1xi1X3oc1vqvPSWAnxRVJekJ0OGoMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REhoJHTe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REhoJHTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720144262; x=1751680262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMNQCMUasj9tQHcdD7prnOJnYW+rkhCcpdiAygtBuhE=;
  b=REhoJHTeRw0l5Zd3PBtP/7BgIlI5w0cIjJN2RAUkxBa6T3CfqrZez3Cb
   8+GkBFgRQNBfR5IvoO/cbPvVv7u0nGe5Pwi15zu7V5+OZy+pr1kziwowJ
   9Px7Nf8h+9YXNc6X2/fFILYBbpM/afBFuxJeK6nE4exr0+/SCwatVC0VV
   ocHvuTqjVMmrwh0pYKkj6A6D5YRb9/bN0/7XikcvIV4p3Czod+OI8EKir
   zIi4KHB16eEDQqKsX5W7cHn0+tvE8Ukl/ZA/bz2tx4nCV2xyET26nGZi+
   8jGFTeZW4yyfTMe38hgNOqAI/mKnhr8nlqDWCmQkyyuOZZOKjZjXU0vVk
   A==;
X-CSE-ConnectionGUID: GZG95rgsRl6xj7ra5nEJSA==
X-CSE-MsgGUID: CjNPseCIQTas1iv2iRYDIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17149608"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17149608"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 18:51:01 -0700
X-CSE-ConnectionGUID: BIR0OR+tT3ulcr/qA/tOJw==
X-CSE-MsgGUID: tMx6YAKTRHmmi/rlavpsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="47170461"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2024 18:51:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPY6D-000RlG-2B;
	Fri, 05 Jul 2024 01:50:57 +0000
Date: Fri, 5 Jul 2024 09:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14560/15088]
 drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:109:57: error: no
 member named 'entity' in 'struct v4l2_subdev'
Message-ID: <202407050931.ZG4N4jmZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   2166fa6b0c817630441a03552541b022f35cfc03
commit: 60e566f1ebecf5c38e7718cc52e5a482505b6742 [14560/15088] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-randconfig-011-20240705 (https://download.01.org/0day-ci/archive/20240705/202407050931.ZG4N4jmZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407050931.ZG4N4jmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050931.ZG4N4jmZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:109:57: error: no member named 'entity' in 'struct v4l2_subdev'
     109 |         struct media_pipeline *mp = media_entity_pipeline(&sd->entity);
         |                                                            ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:124:35: error: no member named 'entity' in 'struct v4l2_subdev'
     124 |         struct media_pad *pad = &asd->sd.entity.pads[sel->pad];
         |                                  ~~~~~~~ ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:156:3: error: field designator 'link_validate' does not refer to any field in type 'const struct v4l2_subdev_pad_ops'
     156 |         .link_validate = __subdev_link_validate,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:171:19: error: use of undeclared identifier 'v4l2_subdev_link_validate'; did you mean '__subdev_link_validate'?
     171 |         .link_validate = v4l2_subdev_link_validate,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                          __subdev_link_validate
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:105:1: note: '__subdev_link_validate' declared here
     105 | __subdev_link_validate(struct v4l2_subdev *sd, struct media_link *link,
         | ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:171:19: error: incompatible function pointer types initializing 'int (*)(struct media_link *)' with an expression of type 'int (struct v4l2_subdev *, struct media_link *, struct v4l2_subdev_format *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-types]
     171 |         .link_validate = v4l2_subdev_link_validate,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:182:10: error: no member named 'entity' in 'struct v4l2_subdev'
     182 |         if (sd->entity.pads[fmt->pad].flags & MEDIA_PAD_FL_SINK) {
         |             ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:191:17: error: no member named 'entity' in 'struct v4l2_subdev'
     191 |         } else if (sd->entity.pads[fmt->pad].flags & MEDIA_PAD_FL_SOURCE) {
         |                    ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:244:22: error: no member named 'entity' in 'struct v4l2_subdev'
     244 |         csi2_be_soc->asd.sd.entity.ops = &csi2_be_soc_entity_ops;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c:327:29: error: no member named 'entity' in 'struct v4l2_subdev'
     327 |                                    &csi2_be_soc->asd.sd.entity,
         |                                     ~~~~~~~~~~~~~~~~~~~ ^
   9 errors generated.
--
   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:350:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     350 |         u32 val, reg;
         |             ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:450:57: error: no member named 'entity' in 'struct v4l2_subdev'
     450 |         struct media_pipeline *mp = media_entity_pipeline(&sd->entity);
         |                                                            ~~  ^
>> drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c:455:28: error: no member named 'entity' in 'v4l2_subdev'
     455 |                 v4l2_get_subdev_hostdata(media_entity_to_v4l2_subdev
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     456 |                                          (ip->external->entity));
         |                                          ~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   1 warning and 2 errors generated.
--
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:146:10: error: call to undeclared function 'v4l2_subdev_get_try_format'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     146 |                 return v4l2_subdev_get_try_format(sd, state, pad);
         |                        ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:146:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_mbus_framefmt *' [-Wint-conversion]
     146 |                 return v4l2_subdev_get_try_format(sd, state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:166:11: error: call to undeclared function 'v4l2_subdev_get_try_crop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |                         return v4l2_subdev_get_try_crop(sd, state, pad);
         |                                ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:166:11: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
     166 |                         return v4l2_subdev_get_try_crop(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:168:11: error: call to undeclared function 'v4l2_subdev_get_try_compose'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     168 |                         return v4l2_subdev_get_try_compose(sd, state, pad);
         |                                ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:168:11: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct v4l2_rect *' [-Wint-conversion]
     168 |                         return v4l2_subdev_get_try_compose(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:207:25: error: no member named 'entity' in 'struct v4l2_subdev'
     207 |         if (WARN_ON(pad >= sd->entity.num_pads))
         |                            ~~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:210:22: error: no member named 'entity' in 'struct v4l2_subdev'
     210 |         ffmts = kcalloc(sd->entity.num_pads,
         |                         ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:216:22: error: no member named 'entity' in 'struct v4l2_subdev'
     216 |         crops = kcalloc(sd->entity.num_pads,
         |                         ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:222:24: error: no member named 'entity' in 'struct v4l2_subdev'
     222 |         compose = kcalloc(sd->entity.num_pads,
         |                           ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:229:22: error: no member named 'entity' in 'struct v4l2_subdev'
     229 |         for (i = 0; i < sd->entity.num_pads; i++) {
         |                         ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:248:19: error: no member named 'entity' in 'struct v4l2_subdev'
     248 |                 if (WARN_ON(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE))
         |                             ~~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:260:19: error: no member named 'entity' in 'struct v4l2_subdev'
     260 |                 if (WARN_ON(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)) {
         |                             ~~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:265:23: error: no member named 'entity' in 'struct v4l2_subdev'
     265 |                 for (i = 1; i < sd->entity.num_pads; i++) {
         |                                 ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:266:14: error: no member named 'entity' in 'struct v4l2_subdev'
     266 |                         if (!(sd->entity.pads[i].flags &
         |                               ~~  ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:284:19: error: no member named 'entity' in 'struct v4l2_subdev'
     284 |                 if (WARN_ON(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SINK)) {
         |                             ~~  ^
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:423:35: error: no member named 'entity' in 'struct v4l2_subdev'
     423 |         struct media_pad *pad = &asd->sd.entity.pads[sel->pad];
         |                                  ~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:514:6: error: no member named 'entity' in 'struct v4l2_subdev'
     514 |             media_entity_to_v4l2_subdev(link->source->entity);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:49: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:373:74: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:514:6: error: no member named 'entity' in 'v4l2_subdev'
     514 |             media_entity_to_v4l2_subdev(link->source->entity);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:483:62: error: no member named 'entity' in 'struct video_device'
     483 |         struct media_pipeline *mp = media_entity_pipeline(&av->vdev.entity);
         |                                                            ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:592:62: error: no member named 'entity' in 'struct video_device'
     592 |         struct media_pad *pad = media_pad_remote_pad_first(av->vdev.entity.pads);
         |                                                            ~~~~~~~~ ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:602:7: error: no member named 'entity' in 'v4l2_subdev'
     602 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:718:43: error: no member named 'entity' in 'struct video_device'
     718 |         first = !media_entity_pipeline(&av->vdev.entity);
         |                                         ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:736:60: error: no member named 'entity' in 'struct video_device'
     736 |         ip = to_ipu_isys_pipeline(media_entity_pipeline(&av->vdev.entity));
         |                                                          ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.h:98:16: note: expanded from macro 'to_ipu_isys_pipeline'
      98 |         container_of((__pipe), struct ipu_isys_pipeline, pipe)
         |                       ^~~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:736:60: error: no member named 'entity' in 'struct video_device'
     736 |         ip = to_ipu_isys_pipeline(media_entity_pipeline(&av->vdev.entity));
         |                                                          ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.h:98:16: note: expanded from macro 'to_ipu_isys_pipeline'
      98 |         container_of((__pipe), struct ipu_isys_pipeline, pipe)
         |                       ^~~~~~
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:736:60: error: no member named 'entity' in 'struct video_device'
     736 |         ip = to_ipu_isys_pipeline(media_entity_pipeline(&av->vdev.entity));
         |                                                          ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.h:98:16: note: expanded from macro 'to_ipu_isys_pipeline'
      98 |         container_of((__pipe), struct ipu_isys_pipeline, pipe)
         |                       ^~~~~~
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:373:63: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:792:62: error: no member named 'entity' in 'struct video_device'
     792 |         struct media_pipeline *mp = media_entity_pipeline(&av->vdev.entity);
         |                                                            ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-queue.c:880:62: error: no member named 'entity' in 'struct video_device'
     880 |         struct media_pipeline *mp = media_entity_pipeline(&av->vdev.entity);
         |                                                            ~~~~~~~~ ^
   9 errors generated.
--
>> drivers/media/pci/intel/ipu6/../ipu-isys-video.c:162:40: error: no member named 'entity' in 'struct video_device'
     162 |         rval = v4l2_pipeline_pm_get(&av->vdev.entity);
         |                                      ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:207:33: error: no member named 'entity' in 'struct video_device'
     207 |         v4l2_pipeline_pm_put(&av->vdev.entity);
         |                               ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:236:33: error: no member named 'entity' in 'struct video_device'
     236 |         v4l2_pipeline_pm_put(&av->vdev.entity);
         |                               ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:265:46: error: no member named 'entity' in 'struct video_device'
     265 |         struct media_pad *pad = other_pad(&av->vdev.entity.pads[0]);
         |                                            ~~~~~~~~ ^
>> drivers/media/pci/intel/ipu6/../ipu-isys-video.c:275:7: error: no member named 'entity' in 'v4l2_subdev'
     275 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:316:46: error: no member named 'entity' in 'struct video_device'
     316 |         struct media_pad *pad = other_pad(&av->vdev.entity.pads[0]);
         |                                            ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:324:7: error: no member named 'entity' in 'v4l2_subdev'
     324 |         sd = media_entity_to_v4l2_subdev(pad->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-video.c:561:7: error: no member named 'entity' in 'struct v4l2_subdev'
     561 |         sd = media_entity_to_v4l2_subdev(entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:49: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:373:74: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:561:7: error: no member named 'entity' in 'v4l2_subdev'
     561 |         sd = media_entity_to_v4l2_subdev(entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-video.c:561:5: error: assigning to 'struct v4l2_subdev *' from incompatible type 'void'
     561 |         sd = media_entity_to_v4l2_subdev(entity);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:586:7: error: no member named 'entity' in 'struct v4l2_subdev'
     586 |         sd = media_entity_to_v4l2_subdev(link->source->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:49: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:373:74: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:586:7: error: no member named 'entity' in 'v4l2_subdev'
     586 |         sd = media_entity_to_v4l2_subdev(link->source->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:586:5: error: assigning to 'struct v4l2_subdev *' from incompatible type 'void'
     586 |         sd = media_entity_to_v4l2_subdev(link->source->entity);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:588:54: error: no member named 'entity' in 'struct video_device'
     588 |                 ip->external = media_pad_remote_pad_first(av->vdev.entity.pads);
         |                                                           ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:638:62: error: no member named 'entity' in 'struct video_device'
     638 |         struct media_pipeline *mp = media_entity_pipeline(&av->vdev.entity);
         |                                                            ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:660:62: error: no member named 'entity' in 'struct video_device'
     660 |         struct media_pipeline *mp = media_entity_pipeline(&av->vdev.entity);
         |                                                            ~~~~~~~~ ^
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:681:7: error: no member named 'entity' in 'struct v4l2_subdev'
     681 |         sd = media_entity_to_v4l2_subdev(ip->external->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:49: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:373:74: note: expanded from macro '__same_type'
     373 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:681:7: error: no member named 'entity' in 'v4l2_subdev'
     681 |         sd = media_entity_to_v4l2_subdev(ip->external->entity);
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1105:3: note: expanded from macro 'media_entity_to_v4l2_subdev'
    1105 |                 container_of(__me_sd_ent, struct v4l2_subdev, entity) : \
         |                 ^                                             ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-video.c:681:5: error: assigning to 'struct v4l2_subdev *' from incompatible type 'void'
     681 |         sd = media_entity_to_v4l2_subdev(ip->external->entity);
         |            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +109 drivers/media/pci/intel/ipu6/../ipu-isys-csi2-be-soc.c

   103	
   104	static int
   105	__subdev_link_validate(struct v4l2_subdev *sd, struct media_link *link,
   106			       struct v4l2_subdev_format *source_fmt,
   107			       struct v4l2_subdev_format *sink_fmt)
   108	{
 > 109		struct media_pipeline *mp = media_entity_pipeline(&sd->entity);
   110		struct ipu_isys_pipeline *ip = container_of(mp,
   111							    struct ipu_isys_pipeline,
   112							    pipe);
   113	
   114		ip->csi2_be_soc = to_ipu_isys_csi2_be_soc(sd);
   115		return ipu_isys_subdev_link_validate(sd, link, source_fmt, sink_fmt);
   116	}
   117	
   118	static int
   119	ipu_isys_csi2_be_soc_set_sel(struct v4l2_subdev *sd,
   120				     struct v4l2_subdev_state *state,
   121				     struct v4l2_subdev_selection *sel)
   122	{
   123		struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
   124		struct media_pad *pad = &asd->sd.entity.pads[sel->pad];
   125	
   126		if (sel->target == V4L2_SEL_TGT_CROP &&
   127		    pad->flags & MEDIA_PAD_FL_SOURCE &&
   128		    asd->valid_tgts[sel->pad].crop) {
   129			enum isys_subdev_prop_tgt tgt =
   130			    IPU_ISYS_SUBDEV_PROP_TGT_SOURCE_CROP;
   131			struct v4l2_mbus_framefmt *ffmt =
   132				__ipu_isys_get_ffmt(sd, state, sel->pad, sel->which);
   133	
   134			if (get_supported_code_index(ffmt->code) < 0) {
   135				/* Non-bayer formats can't be odd lines cropped */
   136				sel->r.left &= ~1;
   137				sel->r.top &= ~1;
   138			}
   139	
   140			sel->r.width = clamp(sel->r.width, IPU_ISYS_MIN_WIDTH,
   141					     IPU_ISYS_MAX_WIDTH);
   142	
   143			sel->r.height = clamp(sel->r.height, IPU_ISYS_MIN_HEIGHT,
   144					      IPU_ISYS_MAX_HEIGHT);
   145	
   146			*__ipu_isys_get_selection(sd, state, sel->target, sel->pad,
   147						  sel->which) = sel->r;
   148			ipu_isys_subdev_fmt_propagate(sd, state, NULL, &sel->r,
   149						      tgt, sel->pad, sel->which);
   150			return 0;
   151		}
   152		return -EINVAL;
   153	}
   154	
   155	static const struct v4l2_subdev_pad_ops csi2_be_soc_sd_pad_ops = {
 > 156		.link_validate = __subdev_link_validate,
   157		.get_fmt = ipu_isys_subdev_get_ffmt,
   158		.set_fmt = ipu_isys_subdev_set_ffmt,
   159		.get_selection = ipu_isys_subdev_get_sel,
   160		.set_selection = ipu_isys_csi2_be_soc_set_sel,
   161		.enum_mbus_code = ipu_isys_subdev_enum_mbus_code,
   162	};
   163	
   164	static struct v4l2_subdev_ops csi2_be_soc_sd_ops = {
   165		.core = &csi2_be_soc_sd_core_ops,
   166		.video = &csi2_be_soc_sd_video_ops,
   167		.pad = &csi2_be_soc_sd_pad_ops,
   168	};
   169	
   170	static struct media_entity_operations csi2_be_soc_entity_ops = {
 > 171		.link_validate = v4l2_subdev_link_validate,
   172	};
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
