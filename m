Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC3F625
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441463; cv=none; b=hf8cpz2XPREJcyycwha0ezbygcWrWVaRxCPHREnF9M5JAAssZipp5vLwuOI7h9ZB60/DqJKYKXxlNIwC2ODMpU1qVoYoJJTh39MAcDkqacfpMvwOc4TqAlUdU2Es2znpoODPcVwcu5MMzI3ZkOdR5DsUNns9ci1BFi1Ws6FDnUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441463; c=relaxed/simple;
	bh=ebLtXo5D+IokwTgkwh8lgalU38UrePDWucsIDG45yc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qE0/NlrUpW5qtPEPkoAQA5Kvtj3QuXMl5GdRU84E/P4lksNa1p2boZKE/wzeB9+23qN8ellrDFYUN59RYvrNZN8ZNYtvbFOumtGObK5iQDJimbXrK/+cGi2s/eQ8yUy31726R0ZST6EpxRW4mQDvBtKwAjluV/8rAVVwbqAAhsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aehUmfC3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aehUmfC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769441461; x=1800977461;
  h=date:from:to:cc:subject:message-id;
  bh=ebLtXo5D+IokwTgkwh8lgalU38UrePDWucsIDG45yc4=;
  b=aehUmfC3sPwSILYhQEw6xIzqGfr4Qsh8dmyMwrkENDnWQCZsDQrRI9K0
   F0oLmXt+RCPo0rclH804c3CWWLqgBgrH0uR1RmVj7M1zLZSy4MxkDqhcX
   iaM5vVp+sdf9zclQm30goJr2zD/ThhXojR7WjQD1rF1LY7RxSTCUDulqk
   eBtPIDgl9MEt6wQVVZTZKCwvgPaDoJf5btlhpor3VcGQxJDqDsvMSAKUA
   A5LGxFYrTOqFrAApCKsmEZNWMMgCuHb2IuY+LMK2maXtq4d0iA5ek6q2N
   Ih+cbbsllosy53JB8XUJi1fBtoxI5nLgBkSSE3oVTxtMWnH98YFcgR6Wk
   g==;
X-CSE-ConnectionGUID: nw/yyIDQSRu0mcOgYdnbrA==
X-CSE-MsgGUID: PvDjtvuDSiKSVU2gOMVJ7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70711105"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70711105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 07:31:00 -0800
X-CSE-ConnectionGUID: JV4CwiwBR4W083IlnJJs4A==
X-CSE-MsgGUID: HoDWqaXcTDiz2p+1USUBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207728242"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2026 07:30:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkOYK-00000000XQu-00HO;
	Mon, 26 Jan 2026 15:30:56 +0000
Date: Mon, 26 Jan 2026 23:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5]
 drivers/media/v4l2-core/v4l2-vcam.c:917:1: warning: the frame size of 1592
 bytes is larger than 1280 bytes
Message-ID: <202601262322.a5MfW4Bd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   43ae87738b05d8f8e7ae4d1d6a250c396687a081
commit: 89e4b2f0909bc377757b65e8565bee625b210c76 [5/5] media: v4l2-vcam
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601262322.a5MfW4Bd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262322.a5MfW4Bd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262322.a5MfW4Bd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-vcam.c: In function 'v4l2_vcam_ioc_vcam_new_validate':
   drivers/media/v4l2-core/v4l2-vcam.c:1209:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1209 |         len = strncpy_from_user(card_label, (void __user *)config->card_label,
         |                                             ^
   drivers/media/v4l2-core/v4l2-vcam.c: In function 'v4l2_vcam_server_ioctl':
>> drivers/media/v4l2-core/v4l2-vcam.c:917:1: warning: the frame size of 1592 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     917 | }
         | ^


vim +917 drivers/media/v4l2-core/v4l2-vcam.c

   662	
   663	static long v4l2_vcam_server_ioctl(struct file *file, unsigned int cmd,
   664					   unsigned long arg)
   665	{
   666		struct v4l2_vcam_data *dev = file->private_data;
   667		void __user *argp = (void __user *)arg;
   668		long ret = 0;
   669	
   670		if (mutex_lock_interruptible(&dev->lock))
   671			return -ERESTARTSYS;
   672	
   673		switch (cmd) {
   674		case VIDIOC_QUERYCAP: {
   675			struct v4l2_capability cap = {};
   676			__u32 capabilities = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_OUTPUT;
   677	
   678			cap.device_caps = capabilities;
   679			cap.capabilities = capabilities | V4L2_CAP_DEVICE_CAPS;
   680	
   681			strscpy(cap.driver, "v4l2 loopback", sizeof(cap.driver));
   682			strscpy(cap.card, dev->vdev->name, sizeof(cap.card));
   683			snprintf(cap.bus_info, sizeof(cap.bus_info), "platform:%.*s",
   684				 (int)(sizeof(cap.bus_info) - sizeof("platform:")),
   685				 dev->v4l2_dev.name);
   686	
   687			memset(cap.reserved, 0, sizeof(cap.reserved));
   688			ret = 0; // The function v4l2_vcam_querycap_out would return 0
   689	
   690			if (!ret && copy_to_user(argp, &cap, sizeof(cap)))
   691				ret = -EFAULT;
   692			break;
   693		}
   694		case VIDIOC_ENUM_FMT: {
   695			struct v4l2_fmtdesc f;
   696	
   697			if (copy_from_user(&f, argp, sizeof(f))) {
   698				ret = -EFAULT;
   699				break;
   700			}
   701			if (f.type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
   702				ret = -EINVAL;
   703				break;
   704			}
   705			ret = v4l2_vcam_enum_fmt_out(dev, &f);
   706			if (!ret && copy_to_user(argp, &f, sizeof(f)))
   707				ret = -EFAULT;
   708			break;
   709		}
   710		case VIDIOC_G_FMT: {
   711			struct v4l2_format fmt;
   712	
   713			if (copy_from_user(&fmt, argp, sizeof(fmt))) {
   714				ret = -EFAULT;
   715				break;
   716			}
   717			if (fmt.type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
   718				ret = -EINVAL;
   719				break;
   720			}
   721			ret = v4l2_vcam_g_fmt_out(dev, &fmt);
   722			if (!ret && copy_to_user(argp, &fmt, sizeof(fmt)))
   723				ret = -EFAULT;
   724			break;
   725		}
   726		case VIDIOC_TRY_FMT: {
   727			struct v4l2_format fmt;
   728	
   729			if (copy_from_user(&fmt, argp, sizeof(fmt))) {
   730				ret = -EFAULT;
   731				break;
   732			}
   733			if (fmt.type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
   734				ret = -EINVAL;
   735				break;
   736			}
   737			ret = v4l2_vcam_try_fmt_out(dev, &fmt);
   738			if (!ret && copy_to_user(argp, &fmt, sizeof(fmt)))
   739				ret = -EFAULT;
   740			break;
   741		}
   742		case VIDIOC_S_FMT: {
   743			struct v4l2_format fmt;
   744	
   745			if (copy_from_user(&fmt, argp, sizeof(fmt))) {
   746				ret = -EFAULT;
   747				break;
   748			}
   749			if (fmt.type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
   750				ret = -EINVAL;
   751				break;
   752			}
   753			ret = v4l2_vcam_s_fmt_out(dev, &fmt);
   754			if (!ret && copy_to_user(argp, &fmt, sizeof(fmt)))
   755				ret = -EFAULT;
   756			break;
   757		}
   758		case VIDIOC_ENUM_FRAMESIZES: {
   759			struct v4l2_frmsizeenum fsize;
   760	
   761			if (copy_from_user(&fsize, argp, sizeof(fsize))) {
   762				ret = -EFAULT;
   763				break;
   764			}
   765			ret = v4l2_vcam_enum_framesizes(dev, &fsize);
   766			if (!ret && copy_to_user(argp, &fsize, sizeof(fsize)))
   767				ret = -EFAULT;
   768			break;
   769		}
   770		case VIDIOC_ENUM_FRAMEINTERVALS: {
   771			struct v4l2_frmivalenum fival;
   772	
   773			if (copy_from_user(&fival, argp, sizeof(fival))) {
   774				ret = -EFAULT;
   775				break;
   776			}
   777			ret = v4l2_vcam_enum_frameintervals(dev, &fival);
   778			if (!ret && copy_to_user(argp, &fival, sizeof(fival)))
   779				ret = -EFAULT;
   780			break;
   781		}
   782		case VIDIOC_G_PARM: {
   783			struct v4l2_streamparm parm;
   784	
   785			if (copy_from_user(&parm, argp, sizeof(parm))) {
   786				ret = -EFAULT;
   787				break;
   788			}
   789			ret = v4l2_vcam_g_parm_out(dev, &parm);
   790			if (!ret && copy_to_user(argp, &parm, sizeof(parm)))
   791				ret = -EFAULT;
   792			break;
   793		}
   794		case VIDIOC_S_PARM: {
   795			struct v4l2_streamparm parm;
   796	
   797			if (copy_from_user(&parm, argp, sizeof(parm))) {
   798				ret = -EFAULT;
   799				break;
   800			}
   801			ret = v4l2_vcam_s_parm_out(dev, &parm);
   802			if (!ret && copy_to_user(argp, &parm, sizeof(parm)))
   803				ret = -EFAULT;
   804			break;
   805		}
   806		case VIDIOC_REQBUFS: {
   807			struct v4l2_requestbuffers req;
   808	
   809			if (copy_from_user(&req, argp, sizeof(req))) {
   810				ret = -EFAULT;
   811				break;
   812			}
   813			ret = v4l2_vcam_server_reqbufs(file, dev, &req);
   814			if (!ret && copy_to_user(argp, &req, sizeof(req)))
   815				ret = -EFAULT;
   816			break;
   817		}
   818		case VIDIOC_CREATE_BUFS: {
   819			struct v4l2_create_buffers bufs;
   820	
   821			if (copy_from_user(&bufs, argp, sizeof(bufs))) {
   822				ret = -EFAULT;
   823				break;
   824			}
   825			ret = v4l2_vcam_server_create_bufs(file, dev, &bufs);
   826			if (!ret && copy_to_user(argp, &bufs, sizeof(bufs)))
   827				ret = -EFAULT;
   828			break;
   829		}
   830		case VIDIOC_PREPARE_BUF: {
   831			struct v4l2_buffer buf;
   832	
   833			if (copy_from_user(&buf, argp, sizeof(buf))) {
   834				ret = -EFAULT;
   835				break;
   836			}
   837			ret = v4l2_vcam_server_prepare_buf(file, dev, &buf);
   838			if (!ret && copy_to_user(argp, &buf, sizeof(buf)))
   839				ret = -EFAULT;
   840			break;
   841		}
   842		case VIDIOC_QUERYBUF: {
   843			struct v4l2_buffer buf;
   844	
   845			if (copy_from_user(&buf, argp, sizeof(buf))) {
   846				ret = -EFAULT;
   847				break;
   848			}
   849			ret = v4l2_vcam_server_querybuf(file, dev, &buf);
   850			if (!ret && copy_to_user(argp, &buf, sizeof(buf)))
   851				ret = -EFAULT;
   852			break;
   853		}
   854		case VIDIOC_EXPBUF: {
   855			struct v4l2_exportbuffer buf;
   856	
   857			if (copy_from_user(&buf, argp, sizeof(buf))) {
   858				ret = -EFAULT;
   859				break;
   860			}
   861			ret = v4l2_vcam_server_expbuf(file, dev, &buf);
   862			if (!ret && copy_to_user(argp, &buf, sizeof(buf)))
   863				ret = -EFAULT;
   864			break;
   865		}
   866		case VIDIOC_QBUF: {
   867			struct v4l2_buffer buf;
   868	
   869			if (copy_from_user(&buf, argp, sizeof(buf))) {
   870				ret = -EFAULT;
   871				break;
   872			}
   873			ret = v4l2_vcam_server_qbuf(file, dev, &buf);
   874			if (!ret && copy_to_user(argp, &buf, sizeof(buf)))
   875				ret = -EFAULT;
   876			break;
   877		}
   878		case VIDIOC_DQBUF: {
   879			struct v4l2_buffer buf;
   880	
   881			if (copy_from_user(&buf, argp, sizeof(buf))) {
   882				ret = -EFAULT;
   883				break;
   884			}
   885			ret = v4l2_vcam_server_dqbuf(file, dev, &buf);
   886			if (!ret && copy_to_user(argp, &buf, sizeof(buf)))
   887				ret = -EFAULT;
   888			break;
   889		}
   890		case VIDIOC_STREAMON: {
   891			enum v4l2_buf_type type;
   892	
   893			if (copy_from_user(&type, argp, sizeof(type))) {
   894				ret = -EFAULT;
   895				break;
   896			}
   897			ret = v4l2_vcam_server_streamon(file, dev, type);
   898			break;
   899		}
   900		case VIDIOC_STREAMOFF: {
   901			enum v4l2_buf_type type;
   902	
   903			if (copy_from_user(&type, argp, sizeof(type))) {
   904				ret = -EFAULT;
   905				break;
   906			}
   907			ret = v4l2_vcam_server_streamoff(file, dev, type);
   908			break;
   909		}
   910		default:
   911			ret = -ENOTTY;
   912			break;
   913		}
   914	
   915		mutex_unlock(&dev->lock);
   916		return ret;
 > 917	}
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
