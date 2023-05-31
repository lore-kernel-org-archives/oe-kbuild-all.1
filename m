Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DC5A4C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 03:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685503140; x=1717039140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rc3ETc7I64gSMT1tTNMXUr3ZF19LVynActWENlkQG/Y=;
  b=BVAAYqCG2WJAadD1PyDplh1+LtVlWN87YcN/nuq4VerY9cdbx4ZXC3Hn
   Do4pexfGOAmvfvehRLpS/kmGSXHu3BNBHbY+PikJUVZ0hJIn3EXXx0gkg
   pgVqFKlMTPuYeHAMCUrduJNAzbnMGC7VdULWa4NAHNOytTuffiAG5qUye
   yqrbIh9g0UrH/U6wWEL28AgGYBsZvOtWHnb2iQ2CFDhsi8+tsZha0wGpJ
   5yr1mW2n5pmisEzjyU6eXoUaOVFk01AAiiiA5HBaI7k3SolubIEJBHnsM
   HaOMl8gUfaNzX+P1snk2HhkP/Y+Cwb9DXMdKBUd6I9aVh9mSMZ04djWJ4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="334741065"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="334741065"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 20:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="706702662"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="706702662"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2023 20:18:56 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4CMR-00012t-2t;
	Wed, 31 May 2023 03:18:55 +0000
Date: Wed, 31 May 2023 11:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Azeem Shaikh <azeemshaikh38@gmail.com>,
	Maxim Krasnyansky <maxk@qti.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hardening@vger.kernel.org,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-um@lists.infradead.org
Subject: Re: [PATCH] uml: Replace all non-returning strlcpy with strscpy
Message-ID: <202305311135.zGMT1gYR-lkp@intel.com>
References: <20230530164004.986750-1-azeemshaikh38@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530164004.986750-1-azeemshaikh38@gmail.com>

Hi Azeem,

kernel test robot noticed the following build errors:

[auto build test ERROR on uml/next]
[also build test ERROR on uml/fixes wireless-next/main wireless/main linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Azeem-Shaikh/uml-Replace-all-non-returning-strlcpy-with-strscpy/20230531-004115
base:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20230530164004.986750-1-azeemshaikh38%40gmail.com
patch subject: [PATCH] uml: Replace all non-returning strlcpy with strscpy
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230531/202305311135.zGMT1gYR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/c51d7beb37cfbda321feb3811bbe0e381f804899
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Azeem-Shaikh/uml-Replace-all-non-returning-strlcpy-with-strscpy/20230531-004115
        git checkout c51d7beb37cfbda321feb3811bbe0e381f804899
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311135.zGMT1gYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/os-Linux/drivers/tuntap_user.c: In function 'tuntap_open':
>> arch/um/os-Linux/drivers/tuntap_user.c:149:17: error: implicit declaration of function 'strscpy'; did you mean 'strncpy'? [-Werror=implicit-function-declaration]
     149 |                 strscpy(ifr.ifr_name, pri->dev_name, sizeof(ifr.ifr_name));
         |                 ^~~~~~~
         |                 strncpy
   cc1: some warnings being treated as errors


vim +149 arch/um/os-Linux/drivers/tuntap_user.c

   127	
   128	static int tuntap_open(void *data)
   129	{
   130		struct ifreq ifr;
   131		struct tuntap_data *pri = data;
   132		char *output, *buffer;
   133		int err, fds[2], len, used;
   134	
   135		err = tap_open_common(pri->dev, pri->gate_addr);
   136		if (err < 0)
   137			return err;
   138	
   139		if (pri->fixed_config) {
   140			pri->fd = os_open_file("/dev/net/tun",
   141					       of_cloexec(of_rdwr(OPENFLAGS())), 0);
   142			if (pri->fd < 0) {
   143				printk(UM_KERN_ERR "Failed to open /dev/net/tun, "
   144				       "err = %d\n", -pri->fd);
   145				return pri->fd;
   146			}
   147			memset(&ifr, 0, sizeof(ifr));
   148			ifr.ifr_flags = IFF_TAP | IFF_NO_PI;
 > 149			strscpy(ifr.ifr_name, pri->dev_name, sizeof(ifr.ifr_name));
   150			if (ioctl(pri->fd, TUNSETIFF, &ifr) < 0) {
   151				err = -errno;
   152				printk(UM_KERN_ERR "TUNSETIFF failed, errno = %d\n",
   153				       errno);
   154				close(pri->fd);
   155				return err;
   156			}
   157		}
   158		else {
   159			err = socketpair(AF_UNIX, SOCK_DGRAM, 0, fds);
   160			if (err) {
   161				err = -errno;
   162				printk(UM_KERN_ERR "tuntap_open : socketpair failed - "
   163				       "errno = %d\n", errno);
   164				return err;
   165			}
   166	
   167			buffer = get_output_buffer(&len);
   168			if (buffer != NULL)
   169				len--;
   170			used = 0;
   171	
   172			err = tuntap_open_tramp(pri->gate_addr, &pri->fd, fds[0],
   173						fds[1], buffer, len, &used);
   174	
   175			output = buffer;
   176			if (err < 0) {
   177				printk("%s", output);
   178				free_output_buffer(buffer);
   179				printk(UM_KERN_ERR "tuntap_open_tramp failed - "
   180				       "err = %d\n", -err);
   181				return err;
   182			}
   183	
   184			pri->dev_name = uml_strdup(buffer);
   185			output += IFNAMSIZ;
   186			printk("%s", output);
   187			free_output_buffer(buffer);
   188	
   189			close(fds[0]);
   190			iter_addresses(pri->dev, open_addr, pri->dev_name);
   191		}
   192	
   193		return pri->fd;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
