Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA38F2EDD40
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 07:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781421273; cv=none; b=Ie/31lrXazmuPArBxiKETjWPvYePXZ55p91dIXyaf4PGRem0z5mmBs+w6jmvZFj1H3/82NFSI/Prx6CJQxjBcP4BI7XRw8IfegN0nicyVrgPupC8VPZbuPKYDDo0OAazlgzrt+MU6up80MqjSpunH1zBPC+AkvFXNy+1PhVHnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781421273; c=relaxed/simple;
	bh=aQTWoNTQeXiZ7lbZSFYi29TmbRZqZcDndOwEGo042t8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IDx63c5sQJz44T4k1VG+tF/4v+5R92GuNcRdywuyuhuQI1/0Ejui7hKQ/nE5n0tJ89TIFqrayYfWlL/jjTK4uRUfeAVIXNXU3xqlPAILJEd/yjwfm8dvzXwh7Qv9/GZJx0AoCoDnZ3Yz91n+oqW/OfDtPamGGMRsVCMLuIkIMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xik2waB1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xik2waB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781421271; x=1812957271;
  h=date:from:to:cc:subject:message-id;
  bh=aQTWoNTQeXiZ7lbZSFYi29TmbRZqZcDndOwEGo042t8=;
  b=Xik2waB1TkZXXlypY8r+kCAbWQKAQU6uih32EYtmf0ftRAtyxmVchaZQ
   ujaWAn/tr9t5aYModj7mZWvcEvvJNIHIct3p/T2GFxi1iePhfagRHK0dD
   eoHeoj5tDT5LAxfMNpPaiGF/Moun8A/bRsZNaTyc43BBxLXHXI0MJ40Ln
   j08cbpxF40KQ1pJSyoMpw4pTbQYr5Btbz5Qf6XfKaD0hbMR1R2SiUK2UF
   W7XPj8CJutRBX4nSg7PETOMLEFJOHtEvd127WAboPoRT6e6is8DVvWoXO
   XMoHCzomiCTGeF3/8pAsPBhwAertfbbUbWhfwAJjBg3hxt8HyGOGLmnkn
   g==;
X-CSE-ConnectionGUID: RUcQEdSFTlKRqUEVeBTvcw==
X-CSE-MsgGUID: ETD3+B8dRneq8YQCLoCJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93311260"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93311260"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 00:14:31 -0700
X-CSE-ConnectionGUID: w7f7+zTnRRay+TiRECj04w==
X-CSE-MsgGUID: InXqDc9CSCOICpJ4q8fXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="270856217"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2026 00:14:30 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYf35-000000004eD-3G7D;
	Sun, 14 Jun 2026 07:14:27 +0000
Date: Sun, 14 Jun 2026 09:13:29 +0200
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/atm/resources.c:227:20: warning: variable 'len' set but
 not used
Message-ID: <202606140928.IoHgThlQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/atm-remove-AAL3-4-transport-support/20260614-041808
head:   5b869563051bea405a4cfaddf0cb286b07a5cfa3
commit: 9cc96275558ce68cfefaecef1829ad9542a4c7dc atm: remove the local ATM (NSAP) address registry
date:   11 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260614/202606140928.IoHgThlQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140928.IoHgThlQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140928.IoHgThlQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/atm/resources.c: In function 'atm_dev_ioctl':
>> net/atm/resources.c:227:20: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     227 |         int error, len, size = 0;
         |                    ^~~


vim +/len +227 net/atm/resources.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  223  
8cacb416598544 Al Viro             2020-05-10  224  int atm_dev_ioctl(unsigned int cmd, void __user *buf, int __user *sioc_len,
8cacb416598544 Al Viro             2020-05-10  225  		  int number, int compat)
8c2348e36af0da Al Viro             2020-05-10  226  {
8cacb416598544 Al Viro             2020-05-10 @227  	int error, len, size = 0;
8c2348e36af0da Al Viro             2020-05-10  228  	struct atm_dev *dev;
8865c418caf4e9 David Woodhouse     2008-12-03  229  
8cacb416598544 Al Viro             2020-05-10  230  	if (get_user(len, sioc_len))
8865c418caf4e9 David Woodhouse     2008-12-03  231  		return -EFAULT;
07b54c9ad4804b Joe Perches         2010-01-26  232  
07b54c9ad4804b Joe Perches         2010-01-26  233  	dev = try_then_request_module(atm_dev_lookup(number), "atm-device-%d",
07b54c9ad4804b Joe Perches         2010-01-26  234  				      number);
07b54c9ad4804b Joe Perches         2010-01-26  235  	if (!dev)
^1da177e4c3f41 Linus Torvalds      2005-04-16  236  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds      2005-04-16  237  
^1da177e4c3f41 Linus Torvalds      2005-04-16  238  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  239  	case ATM_GETTYPE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  240  		size = strlen(dev->type) + 1;
^1da177e4c3f41 Linus Torvalds      2005-04-16  241  		if (copy_to_user(buf, dev->type, size)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  242  			error = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  243  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  244  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  245  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  246  	case ATM_GETESI:
^1da177e4c3f41 Linus Torvalds      2005-04-16  247  		size = ESI_LEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  248  		if (copy_to_user(buf, dev->esi, size)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  249  			error = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  250  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  251  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  252  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  253  	case ATM_SETESI:
^1da177e4c3f41 Linus Torvalds      2005-04-16  254  	{
^1da177e4c3f41 Linus Torvalds      2005-04-16  255  		int i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  256  
^1da177e4c3f41 Linus Torvalds      2005-04-16  257  		for (i = 0; i < ESI_LEN; i++)
^1da177e4c3f41 Linus Torvalds      2005-04-16  258  			if (dev->esi[i]) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  259  				error = -EEXIST;
^1da177e4c3f41 Linus Torvalds      2005-04-16  260  				goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  261  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  262  	}
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  263  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  264  	case ATM_SETESIF:
^1da177e4c3f41 Linus Torvalds      2005-04-16  265  	{
^1da177e4c3f41 Linus Torvalds      2005-04-16  266  		unsigned char esi[ESI_LEN];
^1da177e4c3f41 Linus Torvalds      2005-04-16  267  
^1da177e4c3f41 Linus Torvalds      2005-04-16  268  		if (!capable(CAP_NET_ADMIN)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  269  			error = -EPERM;
^1da177e4c3f41 Linus Torvalds      2005-04-16  270  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  271  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  272  		if (copy_from_user(esi, buf, ESI_LEN)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  273  			error = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  274  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  275  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  276  		memcpy(dev->esi, esi, ESI_LEN);
^1da177e4c3f41 Linus Torvalds      2005-04-16  277  		error =  ESI_LEN;
^1da177e4c3f41 Linus Torvalds      2005-04-16  278  		goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  279  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  280  	case ATM_GETSTATZ:
^1da177e4c3f41 Linus Torvalds      2005-04-16  281  		if (!capable(CAP_NET_ADMIN)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  282  			error = -EPERM;
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  		}
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  285  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  286  	case ATM_GETSTAT:
^1da177e4c3f41 Linus Torvalds      2005-04-16  287  		size = sizeof(struct atm_dev_stats);
^1da177e4c3f41 Linus Torvalds      2005-04-16  288  		error = fetch_stats(dev, buf, cmd == ATM_GETSTATZ);
^1da177e4c3f41 Linus Torvalds      2005-04-16  289  		if (error)
^1da177e4c3f41 Linus Torvalds      2005-04-16  290  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  291  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  292  	case ATM_GETCIRANGE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  293  		size = sizeof(struct atm_cirange);
^1da177e4c3f41 Linus Torvalds      2005-04-16  294  		if (copy_to_user(buf, &dev->ci_range, size)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  295  			error = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  296  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  297  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  	case ATM_GETLINKRATE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  300  		size = sizeof(int);
^1da177e4c3f41 Linus Torvalds      2005-04-16  301  		if (copy_to_user(buf, &dev->link_rate, size)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  			error = -EFAULT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  303  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  304  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  305  		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  306  	case ATM_SETLOOP:
^1da177e4c3f41 Linus Torvalds      2005-04-16  307  		if (__ATM_LM_XTRMT((int) (unsigned long) buf) &&
^1da177e4c3f41 Linus Torvalds      2005-04-16  308  		    __ATM_LM_XTLOC((int) (unsigned long) buf) >
^1da177e4c3f41 Linus Torvalds      2005-04-16  309  		    __ATM_LM_XTRMT((int) (unsigned long) buf)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  310  			error = -EINVAL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  311  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  312  		}
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  313  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  314  	case ATM_SETCIRANGE:
^1da177e4c3f41 Linus Torvalds      2005-04-16  315  		if (!capable(CAP_NET_ADMIN)) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  316  			error = -EPERM;
^1da177e4c3f41 Linus Torvalds      2005-04-16  317  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  318  		}
df561f6688fef7 Gustavo A. R. Silva 2020-08-23  319  		fallthrough;
^1da177e4c3f41 Linus Torvalds      2005-04-16  320  	default:
0805a4b894a8da Nathan Chancellor   2019-03-07  321  		if (IS_ENABLED(CONFIG_COMPAT) && compat) {
8865c418caf4e9 David Woodhouse     2008-12-03  322  #ifdef CONFIG_COMPAT
8865c418caf4e9 David Woodhouse     2008-12-03  323  			if (!dev->ops->compat_ioctl) {
8865c418caf4e9 David Woodhouse     2008-12-03  324  				error = -EINVAL;
8865c418caf4e9 David Woodhouse     2008-12-03  325  				goto done;
8865c418caf4e9 David Woodhouse     2008-12-03  326  			}
8865c418caf4e9 David Woodhouse     2008-12-03  327  			size = dev->ops->compat_ioctl(dev, cmd, buf);
8865c418caf4e9 David Woodhouse     2008-12-03  328  #endif
8865c418caf4e9 David Woodhouse     2008-12-03  329  		} else {
^1da177e4c3f41 Linus Torvalds      2005-04-16  330  			if (!dev->ops->ioctl) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  331  				error = -EINVAL;
^1da177e4c3f41 Linus Torvalds      2005-04-16  332  				goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  333  			}
^1da177e4c3f41 Linus Torvalds      2005-04-16  334  			size = dev->ops->ioctl(dev, cmd, buf);
8865c418caf4e9 David Woodhouse     2008-12-03  335  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  336  		if (size < 0) {
4a2c240691bfdb Wanlong Gao         2012-08-26  337  			error = (size == -ENOIOCTLCMD ? -ENOTTY : size);
^1da177e4c3f41 Linus Torvalds      2005-04-16  338  			goto done;
^1da177e4c3f41 Linus Torvalds      2005-04-16  339  		}
^1da177e4c3f41 Linus Torvalds      2005-04-16  340  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  341  
^1da177e4c3f41 Linus Torvalds      2005-04-16  342  	if (size)
07b54c9ad4804b Joe Perches         2010-01-26  343  		error = put_user(size, sioc_len) ? -EFAULT : 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  344  	else
^1da177e4c3f41 Linus Torvalds      2005-04-16  345  		error = 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  346  done:
^1da177e4c3f41 Linus Torvalds      2005-04-16  347  	atm_dev_put(dev);
^1da177e4c3f41 Linus Torvalds      2005-04-16  348  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  349  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  350  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
