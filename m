Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976D524CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acuHPID1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702320091; x=1733856091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+DyZ8UU/9XXHetIIIi2W3nMVV8qkg3F57XCtDgDVUM=;
  b=acuHPID1bfm2/AeTa9R7tZwoekTyiC3Vf0YWGxc0KfXg2bAl5oRGspEl
   PULMCyY7CnNfa7dxRdqheG0acAbu7LjuVgraV63rD/piWf1QzAX+QtxwV
   oa9Z3y/8rJy4hqvFYMfrL+5sq92TSazTHQX2192viv5QIJSxnrnJjbuBm
   2urEP7Wmmk45LjuFT9lS1K+rVnFJNIJvqv8M4Yefw0za4PGiPKW1f/lOT
   lqhCprBIDcFzejjyKmnoW9zluKj/bd5d3stGuhXIg83iw114W7RQ+dVch
   qG82wm8BQaOJ8ViS63GUnBGN3L0ZBOOvVlpV+q6e62CRs+pHD2Wy4JNaE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1532383"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="1532383"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="843601845"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="843601845"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 11 Dec 2023 10:41:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rClDa-000INI-2R;
	Mon, 11 Dec 2023 18:41:26 +0000
Date: Tue, 12 Dec 2023 02:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6214/6992] fs/bcachefs/super.c:93:17: warning:
 function '__bch2_print' might be a candidate for 'gnu_printf' format
 attribute
Message-ID: <202312120215.R0X1cyU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bbd220ce4e29ed55ab079007cff0b550895258eb
commit: bd6599d01e62591a0b371b58ec9c191475a10285 [6214/6992] bcachefs: Add ability to redirect log output
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20231212/202312120215.R0X1cyU3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120215.R0X1cyU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120215.R0X1cyU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/super.c:31:
   fs/bcachefs/error.h: In function 'bch2_bkey_fsck_err':
   fs/bcachefs/error.h:168:9: warning: function 'bch2_bkey_fsck_err' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     168 |         prt_vprintf(err_msg, fmt, args);
         |         ^~~~~~~~~~~
   fs/bcachefs/super.c: In function '__bch2_print':
>> fs/bcachefs/super.c:93:17: warning: function '__bch2_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      93 |                 vprintk(fmt, args);
         |                 ^~~~~~~
   fs/bcachefs/super.c:101:17: warning: function '__bch2_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     101 |                 prt_vprintf(&output->buf, fmt, args);
         |                 ^~~~~~~~~~~


vim +93 fs/bcachefs/super.c

    82	
    83	void __bch2_print(struct bch_fs *c, const char *fmt, ...)
    84	{
    85		struct log_output *output = c->output;
    86		va_list args;
    87	
    88		if (c->output_filter && c->output_filter != current)
    89			output = NULL;
    90	
    91		va_start(args, fmt);
    92		if (likely(!output)) {
  > 93			vprintk(fmt, args);
    94		} else {
    95			unsigned long flags;
    96	
    97			if (fmt[0] == KERN_SOH[0])
    98				fmt += 2;
    99	
   100			spin_lock_irqsave(&output->lock, flags);
   101			prt_vprintf(&output->buf, fmt, args);
   102			spin_unlock_irqrestore(&output->lock, flags);
   103	
   104			wake_up(&output->wait);
   105		}
   106		va_end(args);
   107	}
   108	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
