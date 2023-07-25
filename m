Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ACB1D2FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 19:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690314437; x=1721850437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VawCzekdCSwpjQSwRPvWxr8uhU4ERio9lD50AvXNN+A=;
  b=nZxq57nMUUM6pQEx6rAMszoCa4DjgIYzzeHPi56hevN+v+NxnGcQTwAe
   cvAfJv/nC/dkyvKAfGPm7rlDtzJrb+sHhA9AHK6pSa8tzSBhmc3B7FGH7
   zAFN9FlRrADUtMK5qGD9iThFxEIgJGW7V7D97JsnPnZHbFzTuFx4t5Mt8
   M3icaUP294jIWTZ264QpHDjct4TXBPH0qt1RyE7DMCDjkrHF62wiKAbmp
   Cg0z8HcQTm+v5qX7BaUnl2XtucAjHcSx2SQ8caWfkDwu1mxPSZOuHpjEr
   pLkuxZdJJCivymAT7IxPkCr385aA4Z/cYj6fxKQuGiXl39lF8Bh6pQxok
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366710890"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="366710890"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 12:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="839957351"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="839957351"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2023 12:47:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOO02-0000IF-1D;
	Tue, 25 Jul 2023 19:47:14 +0000
Date: Wed, 26 Jul 2023 03:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 2102/9999] kernel/bpf/syscall.c:2101: Error:
 unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
Message-ID: <202307260359.hWlOUlGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: b80e052c3ae6900f6dbcd502846650fd3a9828b7 [2102/9999] bpf: Check correct cred for CAP_SYSLOG in bpf_dump_raw_ok()
config: riscv-randconfig-r042-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260359.hWlOUlGs-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260359.hWlOUlGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260359.hWlOUlGs-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: Assembler messages:
   kernel/bpf/syscall.c:1820: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:1820: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:2263: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   kernel/bpf/syscall.c:2263: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   kernel/bpf/syscall.c:2271: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   kernel/bpf/syscall.c:2271: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   kernel/bpf/syscall.c:2286: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:2286: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:2291: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2291: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2292: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2292: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2293: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2293: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   kernel/bpf/syscall.c:2294: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:2294: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   kernel/bpf/syscall.c:93: Error: unrecognized opcode `csrs sstatus,s2', extension `zicsr' required
   kernel/bpf/syscall.c:93: Error: unrecognized opcode `csrc sstatus,s2', extension `zicsr' required
   kernel/bpf/syscall.c:1996: Error: unrecognized opcode `csrs sstatus,s11', extension `zicsr' required
   kernel/bpf/syscall.c:1996: Error: unrecognized opcode `csrc sstatus,s11', extension `zicsr' required
>> kernel/bpf/syscall.c:2101: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
>> kernel/bpf/syscall.c:2101: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
   kernel/bpf/syscall.c:2121: Error: unrecognized opcode `csrs sstatus,s10', extension `zicsr' required
   kernel/bpf/syscall.c:2121: Error: unrecognized opcode `csrc sstatus,s10', extension `zicsr' required
   kernel/bpf/syscall.c:2131: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   kernel/bpf/syscall.c:2131: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   kernel/bpf/syscall.c:2174: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   kernel/bpf/syscall.c:2174: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required


vim +2101 kernel/bpf/syscall.c

7105e828c087de9 Daniel Borkmann    2017-12-20  1956  
b80e052c3ae6900 Kees Cook          2020-07-02  1957  static int bpf_prog_get_info_by_fd(struct file *file,
b80e052c3ae6900 Kees Cook          2020-07-02  1958  				   struct bpf_prog *prog,
1e270976908686e Martin KaFai Lau   2017-06-05  1959  				   const union bpf_attr *attr,
1e270976908686e Martin KaFai Lau   2017-06-05  1960  				   union bpf_attr __user *uattr)
1e270976908686e Martin KaFai Lau   2017-06-05  1961  {
1e270976908686e Martin KaFai Lau   2017-06-05  1962  	struct bpf_prog_info __user *uinfo = u64_to_user_ptr(attr->info.info);
638d8c748e9d8f1 Greg Kroah-Hartman 2020-03-20  1963  	struct bpf_prog_info info;
1e270976908686e Martin KaFai Lau   2017-06-05  1964  	u32 info_len = attr->info.info_len;
1e270976908686e Martin KaFai Lau   2017-06-05  1965  	char __user *uinsns;
1e270976908686e Martin KaFai Lau   2017-06-05  1966  	u32 ulen;
1e270976908686e Martin KaFai Lau   2017-06-05  1967  	int err;
1e270976908686e Martin KaFai Lau   2017-06-05  1968  
dcab51f19b291d5 Martin KaFai Lau   2018-05-22  1969  	err = bpf_check_uarg_tail_zero(uinfo, sizeof(info), info_len);
1e270976908686e Martin KaFai Lau   2017-06-05  1970  	if (err)
1e270976908686e Martin KaFai Lau   2017-06-05  1971  		return err;
1e270976908686e Martin KaFai Lau   2017-06-05  1972  	info_len = min_t(u32, sizeof(info), info_len);
1e270976908686e Martin KaFai Lau   2017-06-05  1973  
638d8c748e9d8f1 Greg Kroah-Hartman 2020-03-20  1974  	memset(&info, 0, sizeof(info));
1e270976908686e Martin KaFai Lau   2017-06-05  1975  	if (copy_from_user(&info, uinfo, info_len))
89b096898a8450b Daniel Borkmann    2017-07-27  1976  		return -EFAULT;
1e270976908686e Martin KaFai Lau   2017-06-05  1977  
1e270976908686e Martin KaFai Lau   2017-06-05  1978  	info.type = prog->type;
1e270976908686e Martin KaFai Lau   2017-06-05  1979  	info.id = prog->aux->id;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1980  	info.load_time = prog->aux->load_time;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1981  	info.created_by_uid = from_kuid_munged(current_user_ns(),
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1982  					       prog->aux->user->uid);
b85fab0e67b1620 Jiri Olsa          2018-04-25  1983  	info.gpl_compatible = prog->gpl_compatible;
1e270976908686e Martin KaFai Lau   2017-06-05  1984  
1e270976908686e Martin KaFai Lau   2017-06-05  1985  	memcpy(info.tag, prog->tag, sizeof(prog->tag));
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1986  	memcpy(info.name, prog->aux->name, sizeof(prog->aux->name));
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1987  
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1988  	ulen = info.nr_map_ids;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1989  	info.nr_map_ids = prog->aux->used_map_cnt;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1990  	ulen = min_t(u32, info.nr_map_ids, ulen);
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1991  	if (ulen) {
721e08dad17e226 Martin KaFai Lau   2017-09-29  1992  		u32 __user *user_map_ids = u64_to_user_ptr(info.map_ids);
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1993  		u32 i;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1994  
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1995  		for (i = 0; i < ulen; i++)
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1996  			if (put_user(prog->aux->used_maps[i]->id,
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1997  				     &user_map_ids[i]))
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1998  				return -EFAULT;
cb4d2b3f03d8eed Martin KaFai Lau   2017-09-27  1999  	}
1e270976908686e Martin KaFai Lau   2017-06-05  2000  
1e270976908686e Martin KaFai Lau   2017-06-05  2001  	if (!capable(CAP_SYS_ADMIN)) {
1e270976908686e Martin KaFai Lau   2017-06-05  2002  		info.jited_prog_len = 0;
1e270976908686e Martin KaFai Lau   2017-06-05  2003  		info.xlated_prog_len = 0;
dbecd7388476aed Sandipan Das       2018-05-24  2004  		info.nr_jited_ksyms = 0;
1a7ccf42cb03cd9 Daniel Borkmann    2018-11-02  2005  		info.nr_jited_func_lens = 0;
1e270976908686e Martin KaFai Lau   2017-06-05  2006  		goto done;
1e270976908686e Martin KaFai Lau   2017-06-05  2007  	}
1e270976908686e Martin KaFai Lau   2017-06-05  2008  
1e270976908686e Martin KaFai Lau   2017-06-05  2009  	ulen = info.xlated_prog_len;
9975a54b3c9ecf0 Daniel Borkmann    2017-07-28  2010  	info.xlated_prog_len = bpf_prog_insn_size(prog);
1e270976908686e Martin KaFai Lau   2017-06-05  2011  	if (info.xlated_prog_len && ulen) {
7105e828c087de9 Daniel Borkmann    2017-12-20  2012  		struct bpf_insn *insns_sanitized;
7105e828c087de9 Daniel Borkmann    2017-12-20  2013  		bool fault;
7105e828c087de9 Daniel Borkmann    2017-12-20  2014  
b80e052c3ae6900 Kees Cook          2020-07-02  2015  		if (prog->blinded && !bpf_dump_raw_ok(file->f_cred)) {
7105e828c087de9 Daniel Borkmann    2017-12-20  2016  			info.xlated_prog_insns = 0;
7105e828c087de9 Daniel Borkmann    2017-12-20  2017  			goto done;
7105e828c087de9 Daniel Borkmann    2017-12-20  2018  		}
b80e052c3ae6900 Kees Cook          2020-07-02  2019  		insns_sanitized = bpf_insn_prepare_dump(prog, file->f_cred);
7105e828c087de9 Daniel Borkmann    2017-12-20  2020  		if (!insns_sanitized)
7105e828c087de9 Daniel Borkmann    2017-12-20  2021  			return -ENOMEM;
1e270976908686e Martin KaFai Lau   2017-06-05  2022  		uinsns = u64_to_user_ptr(info.xlated_prog_insns);
1e270976908686e Martin KaFai Lau   2017-06-05  2023  		ulen = min_t(u32, info.xlated_prog_len, ulen);
7105e828c087de9 Daniel Borkmann    2017-12-20  2024  		fault = copy_to_user(uinsns, insns_sanitized, ulen);
7105e828c087de9 Daniel Borkmann    2017-12-20  2025  		kfree(insns_sanitized);
7105e828c087de9 Daniel Borkmann    2017-12-20  2026  		if (fault)
1e270976908686e Martin KaFai Lau   2017-06-05  2027  			return -EFAULT;
1e270976908686e Martin KaFai Lau   2017-06-05  2028  	}
1e270976908686e Martin KaFai Lau   2017-06-05  2029  
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2030  	if (bpf_prog_is_dev_bound(prog->aux)) {
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2031  		err = bpf_prog_offload_info_fill(&info, prog);
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2032  		if (err)
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2033  			return err;
fcfb126defda3ce Jiong Wang         2018-01-16  2034  		goto done;
fcfb126defda3ce Jiong Wang         2018-01-16  2035  	}
fcfb126defda3ce Jiong Wang         2018-01-16  2036  
fcfb126defda3ce Jiong Wang         2018-01-16  2037  	/* NOTE: the following code is supposed to be skipped for offload.
fcfb126defda3ce Jiong Wang         2018-01-16  2038  	 * bpf_prog_offload_info_fill() is the place to fill similar fields
fcfb126defda3ce Jiong Wang         2018-01-16  2039  	 * for offload.
fcfb126defda3ce Jiong Wang         2018-01-16  2040  	 */
fcfb126defda3ce Jiong Wang         2018-01-16  2041  	ulen = info.jited_prog_len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2042  	if (prog->aux->func_cnt) {
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2043  		u32 i;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2044  
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2045  		info.jited_prog_len = 0;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2046  		for (i = 0; i < prog->aux->func_cnt; i++)
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2047  			info.jited_prog_len += prog->aux->func[i]->jited_len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2048  	} else {
fcfb126defda3ce Jiong Wang         2018-01-16  2049  		info.jited_prog_len = prog->jited_len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2050  	}
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2051  
fcfb126defda3ce Jiong Wang         2018-01-16  2052  	if (info.jited_prog_len && ulen) {
b80e052c3ae6900 Kees Cook          2020-07-02  2053  		if (bpf_dump_raw_ok(file->f_cred)) {
fcfb126defda3ce Jiong Wang         2018-01-16  2054  			uinsns = u64_to_user_ptr(info.jited_prog_insns);
fcfb126defda3ce Jiong Wang         2018-01-16  2055  			ulen = min_t(u32, info.jited_prog_len, ulen);
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2056  
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2057  			/* for multi-function programs, copy the JITed
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2058  			 * instructions for all the functions
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2059  			 */
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2060  			if (prog->aux->func_cnt) {
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2061  				u32 len, free, i;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2062  				u8 *img;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2063  
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2064  				free = ulen;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2065  				for (i = 0; i < prog->aux->func_cnt; i++) {
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2066  					len = prog->aux->func[i]->jited_len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2067  					len = min_t(u32, len, free);
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2068  					img = (u8 *) prog->aux->func[i]->bpf_func;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2069  					if (copy_to_user(uinsns, img, len))
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2070  						return -EFAULT;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2071  					uinsns += len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2072  					free -= len;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2073  					if (!free)
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2074  						break;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2075  				}
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2076  			} else {
fcfb126defda3ce Jiong Wang         2018-01-16  2077  				if (copy_to_user(uinsns, prog->bpf_func, ulen))
fcfb126defda3ce Jiong Wang         2018-01-16  2078  					return -EFAULT;
4d56a76ead2fcd8 Sandipan Das       2018-05-24  2079  			}
fcfb126defda3ce Jiong Wang         2018-01-16  2080  		} else {
fcfb126defda3ce Jiong Wang         2018-01-16  2081  			info.jited_prog_insns = 0;
fcfb126defda3ce Jiong Wang         2018-01-16  2082  		}
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2083  	}
675fc275a3a2d90 Jakub Kicinski     2017-12-27  2084  
dbecd7388476aed Sandipan Das       2018-05-24  2085  	ulen = info.nr_jited_ksyms;
dbecd7388476aed Sandipan Das       2018-05-24  2086  	info.nr_jited_ksyms = prog->aux->func_cnt;
dbecd7388476aed Sandipan Das       2018-05-24  2087  	if (info.nr_jited_ksyms && ulen) {
b80e052c3ae6900 Kees Cook          2020-07-02  2088  		if (bpf_dump_raw_ok(file->f_cred)) {
dbecd7388476aed Sandipan Das       2018-05-24  2089  			u64 __user *user_ksyms;
dbecd7388476aed Sandipan Das       2018-05-24  2090  			ulong ksym_addr;
dbecd7388476aed Sandipan Das       2018-05-24  2091  			u32 i;
dbecd7388476aed Sandipan Das       2018-05-24  2092  
dbecd7388476aed Sandipan Das       2018-05-24  2093  			/* copy the address of the kernel symbol
dbecd7388476aed Sandipan Das       2018-05-24  2094  			 * corresponding to each function
dbecd7388476aed Sandipan Das       2018-05-24  2095  			 */
dbecd7388476aed Sandipan Das       2018-05-24  2096  			ulen = min_t(u32, info.nr_jited_ksyms, ulen);
dbecd7388476aed Sandipan Das       2018-05-24  2097  			user_ksyms = u64_to_user_ptr(info.jited_ksyms);
dbecd7388476aed Sandipan Das       2018-05-24  2098  			for (i = 0; i < ulen; i++) {
dbecd7388476aed Sandipan Das       2018-05-24  2099  				ksym_addr = (ulong) prog->aux->func[i]->bpf_func;
dbecd7388476aed Sandipan Das       2018-05-24  2100  				ksym_addr &= PAGE_MASK;
dbecd7388476aed Sandipan Das       2018-05-24 @2101  				if (put_user((u64) ksym_addr, &user_ksyms[i]))
dbecd7388476aed Sandipan Das       2018-05-24  2102  					return -EFAULT;
dbecd7388476aed Sandipan Das       2018-05-24  2103  			}
dbecd7388476aed Sandipan Das       2018-05-24  2104  		} else {
dbecd7388476aed Sandipan Das       2018-05-24  2105  			info.jited_ksyms = 0;
dbecd7388476aed Sandipan Das       2018-05-24  2106  		}
dbecd7388476aed Sandipan Das       2018-05-24  2107  	}
dbecd7388476aed Sandipan Das       2018-05-24  2108  
815581c11cc29f7 Sandipan Das       2018-05-24  2109  	ulen = info.nr_jited_func_lens;
815581c11cc29f7 Sandipan Das       2018-05-24  2110  	info.nr_jited_func_lens = prog->aux->func_cnt;
815581c11cc29f7 Sandipan Das       2018-05-24  2111  	if (info.nr_jited_func_lens && ulen) {
b80e052c3ae6900 Kees Cook          2020-07-02  2112  		if (bpf_dump_raw_ok(file->f_cred)) {
815581c11cc29f7 Sandipan Das       2018-05-24  2113  			u32 __user *user_lens;
815581c11cc29f7 Sandipan Das       2018-05-24  2114  			u32 func_len, i;
815581c11cc29f7 Sandipan Das       2018-05-24  2115  
815581c11cc29f7 Sandipan Das       2018-05-24  2116  			/* copy the JITed image lengths for each function */
815581c11cc29f7 Sandipan Das       2018-05-24  2117  			ulen = min_t(u32, info.nr_jited_func_lens, ulen);
815581c11cc29f7 Sandipan Das       2018-05-24  2118  			user_lens = u64_to_user_ptr(info.jited_func_lens);
815581c11cc29f7 Sandipan Das       2018-05-24  2119  			for (i = 0; i < ulen; i++) {
815581c11cc29f7 Sandipan Das       2018-05-24  2120  				func_len = prog->aux->func[i]->jited_len;
815581c11cc29f7 Sandipan Das       2018-05-24  2121  				if (put_user(func_len, &user_lens[i]))
815581c11cc29f7 Sandipan Das       2018-05-24  2122  					return -EFAULT;
815581c11cc29f7 Sandipan Das       2018-05-24  2123  			}
815581c11cc29f7 Sandipan Das       2018-05-24  2124  		} else {
815581c11cc29f7 Sandipan Das       2018-05-24  2125  			info.jited_func_lens = 0;
815581c11cc29f7 Sandipan Das       2018-05-24  2126  		}
815581c11cc29f7 Sandipan Das       2018-05-24  2127  	}
815581c11cc29f7 Sandipan Das       2018-05-24  2128  
1e270976908686e Martin KaFai Lau   2017-06-05  2129  done:
1e270976908686e Martin KaFai Lau   2017-06-05  2130  	if (copy_to_user(uinfo, &info, info_len) ||
1e270976908686e Martin KaFai Lau   2017-06-05  2131  	    put_user(info_len, &uattr->info.info_len))
1e270976908686e Martin KaFai Lau   2017-06-05  2132  		return -EFAULT;
1e270976908686e Martin KaFai Lau   2017-06-05  2133  
1e270976908686e Martin KaFai Lau   2017-06-05  2134  	return 0;
1e270976908686e Martin KaFai Lau   2017-06-05  2135  }
1e270976908686e Martin KaFai Lau   2017-06-05  2136  

:::::: The code at line 2101 was first introduced by commit
:::::: dbecd7388476aedeb66389febea84d5450d28773 bpf: get kernel symbol addresses via syscall

:::::: TO: Sandipan Das <sandipan@linux.vnet.ibm.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
