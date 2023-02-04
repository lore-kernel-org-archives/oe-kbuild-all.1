Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAB1C13
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675490555; x=1707026555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DrSFJwobCRz6VsCtkNX2jEfwt/B1Acz/2zAawZzEgvc=;
  b=SdyR530PPHXO9Wnrm9lQ5/GSlcvFQnYnTvHCwWdM2dSOZUtq8FjmmcjX
   7vLUM6O98MzUuk01k7cmAX+xAsX09SroEP7TxmDEdfEmKibkObrpT49d9
   sxzd13zH3pGrKdMS4xUmA614liQWCemKxF0B0s+GEkhFq+htv9Z92EAQN
   M3wYtswzbB9sx3/A/dzL32JWNWRvKUnyH6OVviXg45DlLj1N+gaO0CEWP
   QovQC8yQUpacDmLsk4HsE/yU4rMuRQdv6w4+NfaNVvdhjce0EWmPVC8wE
   tQi3YKJVdAoSq3R6Owk+dQX+I+NqhByMutm975/sK67BuI9NmHauku/Sq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="327557188"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="327557188"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:02:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729483018"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729483018"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 22:02:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOBdB-00015J-0c;
	Sat, 04 Feb 2023 06:02:33 +0000
Date: Sat, 4 Feb 2023 14:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 6/138] drivers/virtio/virtio_wl.c:1093:20: warning: this statement may fall
 through
Message-ID: <202302041410.wgFPOepU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zach,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   573344b8d137d3584c918c7efa8d4b949d0414d4
commit: 7b4638e78f5c6ad83faefe267d8f92a057246209 [6/138] CHROMIUM: virtwl: add virtwl driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041410.wgFPOepU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/7b4638e78f5c6ad83faefe267d8f92a057246209
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout 7b4638e78f5c6ad83faefe267d8f92a057246209
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/virtio/virtio_wl.c: In function 'virtwl_ioctl_recv':
   drivers/virtio/virtio_wl.c:1227:25: error: implicit declaration of function '__close_fd'; did you mean 'close_fd'? [-Werror=implicit-function-declaration]
    1227 |                         __close_fd(current->files, fds[i]);
         |                         ^~~~~~~~~~
         |                         close_fd
   drivers/virtio/virtio_wl.c: In function 'virtwl_ioctl_new':
   drivers/virtio/virtio_wl.c:1296:17: error: implicit declaration of function 'ksys_close'; did you mean 'ksys_chown'? [-Werror=implicit-function-declaration]
    1296 |                 ksys_close(ioctl_new.fd);
         |                 ^~~~~~~~~~
         |                 ksys_chown
   drivers/virtio/virtio_wl.c: In function 'do_new':
>> drivers/virtio/virtio_wl.c:1093:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1093 |                 if (ioctl_new_size == sizeof(*ioctl_new)) {
         |                    ^
   drivers/virtio/virtio_wl.c:1101:9: note: here
    1101 |         default:
         |         ^~~~~~~
   cc1: some warnings being treated as errors


vim +1093 drivers/virtio/virtio_wl.c

  1024	
  1025	static struct virtwl_vfd *do_new(struct virtwl_info *vi,
  1026					 struct virtwl_ioctl_new *ioctl_new,
  1027					 size_t ioctl_new_size, bool nonblock)
  1028	{
  1029		struct virtio_wl_ctrl_vfd_new *ctrl_new;
  1030		struct virtwl_vfd *vfd;
  1031		struct completion finish_completion;
  1032		struct scatterlist out_sg;
  1033		struct scatterlist in_sg;
  1034		int ret = 0;
  1035	
  1036		if (ioctl_new->type != VIRTWL_IOCTL_NEW_CTX &&
  1037			ioctl_new->type != VIRTWL_IOCTL_NEW_CTX_NAMED &&
  1038			ioctl_new->type != VIRTWL_IOCTL_NEW_ALLOC &&
  1039			ioctl_new->type != VIRTWL_IOCTL_NEW_PIPE_READ &&
  1040			ioctl_new->type != VIRTWL_IOCTL_NEW_PIPE_WRITE &&
  1041			ioctl_new->type != VIRTWL_IOCTL_NEW_DMABUF)
  1042			return ERR_PTR(-EINVAL);
  1043	
  1044		ctrl_new = kzalloc(sizeof(*ctrl_new), GFP_KERNEL);
  1045		if (!ctrl_new)
  1046			return ERR_PTR(-ENOMEM);
  1047	
  1048		vfd = virtwl_vfd_alloc(vi);
  1049		if (!vfd) {
  1050			ret = -ENOMEM;
  1051			goto free_ctrl_new;
  1052		}
  1053	
  1054		mutex_lock(&vi->vfds_lock);
  1055		/*
  1056		 * Take the lock before adding it to the vfds list where others might
  1057		 * reference it.
  1058		 */
  1059		mutex_lock(&vfd->lock);
  1060		ret = idr_alloc(&vi->vfds, vfd, 1, VIRTWL_MAX_ALLOC, GFP_KERNEL);
  1061		mutex_unlock(&vi->vfds_lock);
  1062		if (ret <= 0)
  1063			goto remove_vfd;
  1064	
  1065		vfd->id = ret;
  1066		ret = 0;
  1067	
  1068		ctrl_new->vfd_id = vfd->id;
  1069		switch (ioctl_new->type) {
  1070		case VIRTWL_IOCTL_NEW_CTX:
  1071			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_CTX;
  1072			ctrl_new->flags = VIRTIO_WL_VFD_WRITE | VIRTIO_WL_VFD_READ;
  1073			break;
  1074		case VIRTWL_IOCTL_NEW_CTX_NAMED:
  1075			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_CTX_NAMED;
  1076			ctrl_new->flags = VIRTIO_WL_VFD_WRITE | VIRTIO_WL_VFD_READ;
  1077			memcpy(ctrl_new->name, ioctl_new->name, sizeof(ctrl_new->name));
  1078			break;
  1079		case VIRTWL_IOCTL_NEW_ALLOC:
  1080			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW;
  1081			ctrl_new->size = PAGE_ALIGN(ioctl_new->size);
  1082			break;
  1083		case VIRTWL_IOCTL_NEW_PIPE_READ:
  1084			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_PIPE;
  1085			ctrl_new->flags = VIRTIO_WL_VFD_READ;
  1086			break;
  1087		case VIRTWL_IOCTL_NEW_PIPE_WRITE:
  1088			ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_PIPE;
  1089			ctrl_new->flags = VIRTIO_WL_VFD_WRITE;
  1090			break;
  1091		case VIRTWL_IOCTL_NEW_DMABUF:
  1092			/* Make sure ioctl_new contains enough data for NEW_DMABUF. */
> 1093			if (ioctl_new_size == sizeof(*ioctl_new)) {
  1094				ctrl_new->hdr.type = VIRTIO_WL_CMD_VFD_NEW_DMABUF;
  1095				/* FIXME: convert from host byte order. */
  1096				memcpy(&ctrl_new->dmabuf, &ioctl_new->dmabuf,
  1097				       sizeof(ioctl_new->dmabuf));
  1098				break;
  1099			}
  1100			/* fall-through */
  1101		default:
  1102			ret = -EINVAL;
  1103			goto remove_vfd;
  1104		}
  1105	
  1106		init_completion(&finish_completion);
  1107		sg_init_one(&out_sg, ctrl_new, sizeof(*ctrl_new));
  1108		sg_init_one(&in_sg, ctrl_new, sizeof(*ctrl_new));
  1109	
  1110		ret = vq_queue_out(vi, &out_sg, &in_sg, &finish_completion, nonblock);
  1111		if (ret)
  1112			goto remove_vfd;
  1113	
  1114		wait_for_completion(&finish_completion);
  1115	
  1116		ret = virtwl_resp_err(ctrl_new->hdr.type);
  1117		if (ret)
  1118			goto remove_vfd;
  1119	
  1120		vfd->size = ctrl_new->size;
  1121		vfd->pfn = ctrl_new->pfn;
  1122		vfd->flags = ctrl_new->flags;
  1123	
  1124		mutex_unlock(&vfd->lock);
  1125	
  1126		if (ioctl_new->type == VIRTWL_IOCTL_NEW_DMABUF) {
  1127			/* FIXME: convert to host byte order. */
  1128			memcpy(&ioctl_new->dmabuf, &ctrl_new->dmabuf,
  1129			       sizeof(ctrl_new->dmabuf));
  1130		}
  1131	
  1132		kfree(ctrl_new);
  1133		return vfd;
  1134	
  1135	remove_vfd:
  1136		/*
  1137		 * unlock the vfd to avoid deadlock when unlinking it
  1138		 * or freeing a held lock
  1139		 */
  1140		mutex_unlock(&vfd->lock);
  1141		/* this is safe since the id cannot change after the vfd is created */
  1142		if (vfd->id)
  1143			virtwl_vfd_lock_unlink(vfd);
  1144		virtwl_vfd_free(vfd);
  1145	free_ctrl_new:
  1146		kfree(ctrl_new);
  1147		return ERR_PTR(ret);
  1148	}
  1149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
