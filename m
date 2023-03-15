Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FF211C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678863270; x=1710399270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJUvjMIoATm12dkYWBDQcfINtkmtWwm2Qk/UG1buo6U=;
  b=F8UKK0ZjOxXoQTT6M//mqeBjI4FqaHxZ1+3lyAWKLQA+O76omqf+nFhj
   pSqQuUS/Yx2Fpq1ZMbHOREQLub/nmo3fUrTb/EHwF0OFmP2EKj4xVgVzn
   hui3D7HYwaFPzRl+kfzJg8JTUI0KdwiEIjXL15GB1hVWqdsARQZkPg5zM
   rBteK0opWDpyIyabF5+N3k2Eou/C3S0w2wwn9auVA1Ch4jQj/8kczmHNn
   OqKY537lkB7vMywMGCBxRF8EZRWOyAz5BwcgFJnxWHJlre/KgpZFr3khq
   v9rZXdORIWLY5KCmpX44+WeD2u9toVRemocRXO141yfmLUtRC8jLz/xgP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400211617"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400211617"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 23:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="822661807"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="822661807"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2023 23:54:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcL1k-0007VF-1i;
	Wed, 15 Mar 2023 06:54:24 +0000
Date: Wed, 15 Mar 2023 14:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [linux-stable-rc:queue/4.19 14/37]
 drivers/misc/genwqe/card_dev.c:1097: Error: unrecognized opcode `csrs
 sstatus,s4'
Message-ID: <202303151449.KbuglTxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/4.19
head:   ceab06d3ee4b9b96e8572e8da01748a56bb4cae2
commit: 4df82b9549d63f7fd7d441f2c5a5bcc15335269d [14/37] riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230315/202303151449.KbuglTxH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=4df82b9549d63f7fd7d441f2c5a5bcc15335269d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/4.19
        git checkout 4df82b9549d63f7fd7d441f2c5a5bcc15335269d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/misc/genwqe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151449.KbuglTxH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/genwqe/card_dev.c: Assembler messages:
   drivers/misc/genwqe/card_dev.c:1070: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/misc/genwqe/card_dev.c:1070: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/misc/genwqe/card_dev.c:1077: Error: unrecognized opcode `csrs sstatus,a3'
   drivers/misc/genwqe/card_dev.c:1077: Error: unrecognized opcode `csrc sstatus,a3'
   drivers/misc/genwqe/card_dev.c:1084: Error: unrecognized opcode `csrs sstatus,a4'
   drivers/misc/genwqe/card_dev.c:1084: Error: unrecognized opcode `csrc sstatus,a4'
>> drivers/misc/genwqe/card_dev.c:1097: Error: unrecognized opcode `csrs sstatus,s4'
>> drivers/misc/genwqe/card_dev.c:1097: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1103: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1103: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1113: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1113: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1120: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1120: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1133: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1133: Error: unrecognized opcode `csrc sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1139: Error: unrecognized opcode `csrs sstatus,s4'
   drivers/misc/genwqe/card_dev.c:1139: Error: unrecognized opcode `csrc sstatus,s4'


vim +1097 drivers/misc/genwqe/card_dev.c

eaf4722d4645c6 Frank Haverkamp           2013-12-09  1040  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1041  /**
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1042   * genwqe_ioctl() - IO control
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1043   * @filp:       file handle
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1044   * @cmd:        command identifier (passed from user)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1045   * @arg:        argument (passed from user)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1046   *
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1047   * Return: 0 success
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1048   */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1049  static long genwqe_ioctl(struct file *filp, unsigned int cmd,
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1050  			 unsigned long arg)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1051  {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1052  	int rc = 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1053  	struct genwqe_file *cfile = (struct genwqe_file *)filp->private_data;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1054  	struct genwqe_dev *cd = cfile->cd;
fb145456fa4f43 Kleber Sacilotto de Souza 2014-06-04  1055  	struct pci_dev *pci_dev = cd->pci_dev;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1056  	struct genwqe_reg_io __user *io;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1057  	u64 val;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1058  	u32 reg_offs;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1059  
fb145456fa4f43 Kleber Sacilotto de Souza 2014-06-04  1060  	/* Return -EIO if card hit EEH */
fb145456fa4f43 Kleber Sacilotto de Souza 2014-06-04  1061  	if (pci_channel_offline(pci_dev))
fb145456fa4f43 Kleber Sacilotto de Souza 2014-06-04  1062  		return -EIO;
fb145456fa4f43 Kleber Sacilotto de Souza 2014-06-04  1063  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1064  	if (_IOC_TYPE(cmd) != GENWQE_IOC_CODE)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1065  		return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1066  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1067  	switch (cmd) {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1068  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1069  	case GENWQE_GET_CARD_STATE:
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1070  		put_user(cd->card_state, (enum genwqe_card_state __user *)arg);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1071  		return 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1072  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1073  		/* Register access */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1074  	case GENWQE_READ_REG64: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1075  		io = (struct genwqe_reg_io __user *)arg;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1076  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1077  		if (get_user(reg_offs, &io->num))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1078  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1079  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1080  		if ((reg_offs >= cd->mmio_len) || (reg_offs & 0x7))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1081  			return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1082  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1083  		val = __genwqe_readq(cd, reg_offs);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1084  		put_user(val, &io->val64);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1085  		return 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1086  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1087  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1088  	case GENWQE_WRITE_REG64: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1089  		io = (struct genwqe_reg_io __user *)arg;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1090  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1091  		if (!capable(CAP_SYS_ADMIN))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1092  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1093  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1094  		if ((filp->f_flags & O_ACCMODE) == O_RDONLY)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1095  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1096  
d276b6c54d47a4 Frank Haverkamp           2013-12-22 @1097  		if (get_user(reg_offs, &io->num))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1098  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1099  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1100  		if ((reg_offs >= cd->mmio_len) || (reg_offs & 0x7))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1101  			return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1102  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1103  		if (get_user(val, &io->val64))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1104  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1105  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1106  		__genwqe_writeq(cd, reg_offs, val);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1107  		return 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1108  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1109  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1110  	case GENWQE_READ_REG32: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1111  		io = (struct genwqe_reg_io __user *)arg;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1112  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1113  		if (get_user(reg_offs, &io->num))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1114  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1115  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1116  		if ((reg_offs >= cd->mmio_len) || (reg_offs & 0x3))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1117  			return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1118  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1119  		val = __genwqe_readl(cd, reg_offs);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1120  		put_user(val, &io->val64);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1121  		return 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1122  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1123  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1124  	case GENWQE_WRITE_REG32: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1125  		io = (struct genwqe_reg_io __user *)arg;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1126  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1127  		if (!capable(CAP_SYS_ADMIN))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1128  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1129  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1130  		if ((filp->f_flags & O_ACCMODE) == O_RDONLY)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1131  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1132  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1133  		if (get_user(reg_offs, &io->num))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1134  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1135  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1136  		if ((reg_offs >= cd->mmio_len) || (reg_offs & 0x3))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1137  			return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1138  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1139  		if (get_user(val, &io->val64))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1140  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1141  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1142  		__genwqe_writel(cd, reg_offs, val);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1143  		return 0;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1144  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1145  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1146  		/* Flash update/reading */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1147  	case GENWQE_SLU_UPDATE: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1148  		struct genwqe_bitstream load;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1149  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1150  		if (!genwqe_is_privileged(cd))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1151  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1152  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1153  		if ((filp->f_flags & O_ACCMODE) == O_RDONLY)
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1154  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1155  
58d66ce732378f Frank Haverkamp           2013-12-20  1156  		if (copy_from_user(&load, (void __user *)arg,
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1157  				   sizeof(load)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1158  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1159  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1160  		rc = do_flash_update(cfile, &load);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1161  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1162  		if (copy_to_user((void __user *)arg, &load, sizeof(load)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1163  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1164  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1165  		return rc;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1166  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1167  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1168  	case GENWQE_SLU_READ: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1169  		struct genwqe_bitstream load;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1170  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1171  		if (!genwqe_is_privileged(cd))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1172  			return -EPERM;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1173  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1174  		if (genwqe_flash_readback_fails(cd))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1175  			return -ENOSPC;	 /* known to fail for old versions */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1176  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1177  		if (copy_from_user(&load, (void __user *)arg, sizeof(load)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1178  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1179  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1180  		rc = do_flash_read(cfile, &load);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1181  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1182  		if (copy_to_user((void __user *)arg, &load, sizeof(load)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1183  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1184  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1185  		return rc;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1186  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1187  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1188  		/* memory pinning and unpinning */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1189  	case GENWQE_PIN_MEM: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1190  		struct genwqe_mem m;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1191  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1192  		if (copy_from_user(&m, (void __user *)arg, sizeof(m)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1193  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1194  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1195  		return genwqe_pin_mem(cfile, &m);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1196  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1197  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1198  	case GENWQE_UNPIN_MEM: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1199  		struct genwqe_mem m;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1200  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1201  		if (copy_from_user(&m, (void __user *)arg, sizeof(m)))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1202  			return -EFAULT;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1203  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1204  		return genwqe_unpin_mem(cfile, &m);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1205  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1206  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1207  		/* launch an DDCB and wait for completion */
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1208  	case GENWQE_EXECUTE_DDCB:
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1209  		return do_execute_ddcb(cfile, arg, 0);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1210  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1211  	case GENWQE_EXECUTE_RAW_DDCB: {
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1212  
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1213  		if (!capable(CAP_SYS_ADMIN))
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1214  			return -EPERM;
d276b6c54d47a4 Frank Haverkamp           2013-12-22  1215  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1216  		return do_execute_ddcb(cfile, arg, 1);
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1217  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1218  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1219  	default:
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1220  		return -EINVAL;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1221  	}
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1222  
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1223  	return rc;
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1224  }
eaf4722d4645c6 Frank Haverkamp           2013-12-09  1225  

:::::: The code at line 1097 was first introduced by commit
:::::: d276b6c54d47a427e4cffd7c84f3b631a1edf98e GenWQE: Rework return code for flash-update ioctl

:::::: TO: Frank Haverkamp <haver@linux.vnet.ibm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
