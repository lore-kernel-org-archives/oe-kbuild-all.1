Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A802D1DA33
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Dec 2023 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="A3qMwIaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtknsqEmGF/HMshgeYqxVJJg8oj1XFKKK8wgoWOHk/8=;
  b=A3qMwIaKfjpYN0G6983pBNWftBW8D/PPJsJaogkHDXhMoFY52TVmH4US
   3sJz96B4SKxxlabINxF9r45UYSbrjyMreUDbUzMgDnBn+APO3B+zy/8l/
   UkyuF+qdQtVX5yWcFuB7xZ44y5nbzzEtOdbLCkQtC2ABqJtB1tJ4d9Mpu
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,291,1695679200"; 
   d="scan'208";a="74936801"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 10:42:34 +0100
Date: Wed, 20 Dec 2023 10:42:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Chandrakanth patil <chandrakanth.patil@broadcom.com>
cc: "Martin K. Petersen" <martin.petersen@oracle.com>, 
    Sathya Prakash <sathya.prakash@broadcom.com>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4321/9096] drivers/scsi/mpi3mr/mpi3mr_app.c:1096:14-15:
 WARNING opportunity for min() (fwd)
Message-ID: <2b12f4b-4f1c-3d57-9081-6ee81169545c@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Just a suggestion.  Maybe the code seems more readable as is.

thanks,
julia

---------- Forwarded message ----------
Date: Wed, 20 Dec 2023 15:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4321/9096]
    drivers/scsi/mpi3mr/mpi3mr_app.c:1096:14-15: WARNING opportunity for min()

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chandrakanth patil <chandrakanth.patil@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Sathya Prakash <sathya.prakash@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa4db8324c4d0e67aa4670356df4e9fae14b4d37
commit: fb231d7deffb41fd445929a3b79815277b883fec [4321/9096] scsi: mpi3mr: Support for preallocation of SGL BSG data buffers part-2
:::::: branch date: 27 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-051-20231220 (https://download.01.org/0day-ci/archive/20231220/202312201503.1ZYNkA6N-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312201503.1ZYNkA6N-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/scsi/mpi3mr/mpi3mr_app.c:1096:14-15: WARNING opportunity for min()

vim +1096 drivers/scsi/mpi3mr/mpi3mr_app.c

fb231d7deffb41 Chandrakanth patil 2023-12-06  1057
fb231d7deffb41 Chandrakanth patil 2023-12-06  1058  /**
fb231d7deffb41 Chandrakanth patil 2023-12-06  1059   * mpi3mr_map_data_buffer_dma - build dma descriptors for data
fb231d7deffb41 Chandrakanth patil 2023-12-06  1060   *                              buffers
fb231d7deffb41 Chandrakanth patil 2023-12-06  1061   * @mrioc: Adapter instance reference
fb231d7deffb41 Chandrakanth patil 2023-12-06  1062   * @drv_buf: buffer map descriptor
fb231d7deffb41 Chandrakanth patil 2023-12-06  1063   * @desc_count: Number of already consumed dma descriptors
fb231d7deffb41 Chandrakanth patil 2023-12-06  1064   *
fb231d7deffb41 Chandrakanth patil 2023-12-06  1065   * This function computes how many pre-allocated DMA descriptors
fb231d7deffb41 Chandrakanth patil 2023-12-06  1066   * are required for the given data buffer and if those number of
fb231d7deffb41 Chandrakanth patil 2023-12-06  1067   * descriptors are free, then setup the mapping of the scattered
fb231d7deffb41 Chandrakanth patil 2023-12-06  1068   * DMA address to the given data buffer, if the data direction
fb231d7deffb41 Chandrakanth patil 2023-12-06  1069   * of the buffer is DMA_TO_DEVICE then the actual data is copied to
fb231d7deffb41 Chandrakanth patil 2023-12-06  1070   * the DMA buffers
fb231d7deffb41 Chandrakanth patil 2023-12-06  1071   *
fb231d7deffb41 Chandrakanth patil 2023-12-06  1072   * Return: 0 on success, -1 on failure
fb231d7deffb41 Chandrakanth patil 2023-12-06  1073   */
fb231d7deffb41 Chandrakanth patil 2023-12-06  1074  static int mpi3mr_map_data_buffer_dma(struct mpi3mr_ioc *mrioc,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1075  				      struct mpi3mr_buf_map *drv_buf,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1076  				      u16 desc_count)
fb231d7deffb41 Chandrakanth patil 2023-12-06  1077  {
fb231d7deffb41 Chandrakanth patil 2023-12-06  1078  	u16 i, needed_desc = drv_buf->kern_buf_len / MPI3MR_IOCTL_SGE_SIZE;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1079  	u32 buf_len = drv_buf->kern_buf_len, copied_len = 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1080
fb231d7deffb41 Chandrakanth patil 2023-12-06  1081  	if (drv_buf->kern_buf_len % MPI3MR_IOCTL_SGE_SIZE)
fb231d7deffb41 Chandrakanth patil 2023-12-06  1082  		needed_desc++;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1083  	if ((needed_desc + desc_count) > MPI3MR_NUM_IOCTL_SGE) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  1084  		dprint_bsg_err(mrioc, "%s: DMA descriptor mapping error %d:%d:%d\n",
fb231d7deffb41 Chandrakanth patil 2023-12-06  1085  			       __func__, needed_desc, desc_count, MPI3MR_NUM_IOCTL_SGE);
fb231d7deffb41 Chandrakanth patil 2023-12-06  1086  		return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1087  	}
fb231d7deffb41 Chandrakanth patil 2023-12-06  1088  	drv_buf->dma_desc = kzalloc(sizeof(*drv_buf->dma_desc) * needed_desc,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1089  				    GFP_KERNEL);
fb231d7deffb41 Chandrakanth patil 2023-12-06  1090  	if (!drv_buf->dma_desc)
fb231d7deffb41 Chandrakanth patil 2023-12-06  1091  		return -1;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1092  	for (i = 0; i < needed_desc; i++, desc_count++) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  1093  		drv_buf->dma_desc[i].addr = mrioc->ioctl_sge[desc_count].addr;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1094  		drv_buf->dma_desc[i].dma_addr =
fb231d7deffb41 Chandrakanth patil 2023-12-06  1095  		    mrioc->ioctl_sge[desc_count].dma_addr;
fb231d7deffb41 Chandrakanth patil 2023-12-06 @1096  		if (buf_len < mrioc->ioctl_sge[desc_count].size)
fb231d7deffb41 Chandrakanth patil 2023-12-06  1097  			drv_buf->dma_desc[i].size = buf_len;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1098  		else
fb231d7deffb41 Chandrakanth patil 2023-12-06  1099  			drv_buf->dma_desc[i].size =
fb231d7deffb41 Chandrakanth patil 2023-12-06  1100  			    mrioc->ioctl_sge[desc_count].size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1101  		buf_len -= drv_buf->dma_desc[i].size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1102  		memset(drv_buf->dma_desc[i].addr, 0,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1103  		       mrioc->ioctl_sge[desc_count].size);
fb231d7deffb41 Chandrakanth patil 2023-12-06  1104  		if (drv_buf->data_dir == DMA_TO_DEVICE) {
fb231d7deffb41 Chandrakanth patil 2023-12-06  1105  			memcpy(drv_buf->dma_desc[i].addr,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1106  			       drv_buf->bsg_buf + copied_len,
fb231d7deffb41 Chandrakanth patil 2023-12-06  1107  			       drv_buf->dma_desc[i].size);
fb231d7deffb41 Chandrakanth patil 2023-12-06  1108  			copied_len += drv_buf->dma_desc[i].size;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1109  		}
fb231d7deffb41 Chandrakanth patil 2023-12-06  1110  	}
fb231d7deffb41 Chandrakanth patil 2023-12-06  1111  	drv_buf->num_dma_desc = needed_desc;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1112  	return 0;
fb231d7deffb41 Chandrakanth patil 2023-12-06  1113  }
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1114  /**
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1115   * mpi3mr_bsg_process_mpt_cmds - MPI Pass through BSG handler
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1116   * @job: BSG job reference
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1117   *
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1118   * This function is the top level handler for MPI Pass through
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1119   * command, this does basic validation of the input data buffers,
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1120   * identifies the given buffer types and MPI command, allocates
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1121   * DMAable memory for user given buffers, construstcs SGL
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1122   * properly and passes the command to the firmware.
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1123   *
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1124   * Once the MPI command is completed the driver copies the data
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1125   * if any and reply, sense information to user provided buffers.
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1126   * If the command is timed out then issues controller reset
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1127   * prior to returning.
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1128   *
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1129   * Return: 0 on success and proper error codes on failure
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1130   */
506bc1a0d6ba62 Sumit Saxena       2022-04-29  1131

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
