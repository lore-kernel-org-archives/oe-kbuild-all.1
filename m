Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211F14B947
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719051946; cv=none; b=d6WyDPkI/RPLLTJBrS1VEFMls6rC2IZYGh8rynxdTDGVG3jfsFMEqZ8WHCYxIuaka7h46ZlZSkfUA0YtJgwab0Nv42FhS18pabmloKXCywpeUrwxXr0xEvcyHIkpUeM1xyDCMGKIO/V6rpOh8xzsmBS6V9BQH8VcaDO2j/0BhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719051946; c=relaxed/simple;
	bh=8rT2CqGnm/TJMqmJVoOCjXiNPR3P/9auGCszE/EieWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKwZ1NzpuzRhUOoffBouI+dxu92YOjcFgjZNIwLuE7ylgIINwclt7ac1E8BUPGlnhAioWZs4bHEK4HRQW//mb81/0+AKOPnHUzPK3Qma+KhtWdRKcYfGKQIw+fAPHBIKQmLxs9xEY6x+8s7hR+nLHlsKf/ZWM9NPwsDzAjHPQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVYct8X9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVYct8X9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719051945; x=1750587945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8rT2CqGnm/TJMqmJVoOCjXiNPR3P/9auGCszE/EieWM=;
  b=fVYct8X9/4qxBU7hcOqnI5FRrjkCVnsDvDF9Z4JDs6A/jcvdCEFSJvbx
   SUh81Qyx2MiaDozmFrO6LkbWkBkS26IrclckJvlUpC7fv83z3/I7487jK
   BJXcYKpXm3Ke+8udJAA/iFWqF6nFT+shvgP+IzmZpgASSX+EfMgZBXo1q
   1SdoxSJgXCzO2hNGgwRhUtBsLfK00YBK0OSnH6zNsPfPvzHhctQdYs9Fd
   tmm7cSZCEh4RsYs/J9aOF0myiLdY+eWmR5OF+LIrpqfdr6f3ZQS7ldlnX
   jWnpwb7OFdhZyKvEm7zakfhM3FBOhCXI20vqWRW/7BRimjpRqjbeJazjd
   w==;
X-CSE-ConnectionGUID: mAhiWAZoRbGnAIWJjDG4rQ==
X-CSE-MsgGUID: 5QTtrEvaRXySmzFnv+2aug==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="27215838"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="27215838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 03:25:44 -0700
X-CSE-ConnectionGUID: aoubWgVLSbCWco7+0w6/nQ==
X-CSE-MsgGUID: 8zxM5mGzTc6JX+FpqcLfpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="73576700"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2024 03:25:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKxwC-0009XW-1j;
	Sat, 22 Jun 2024 10:25:40 +0000
Date: Sat, 22 Jun 2024 18:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrii Nakryiko <andrii@kernel.org>
Subject: [bpf-next:master 9/12] kernel/bpf/btf.c:8251:36: error: implicit
 declaration of function 'btf_relocate_id'; did you mean 'btf_relocate'?
Message-ID: <202406221805.CeoGYjz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   93265a0b79e48fde8ee23fb6e1195d7d99717063
commit: 8646db238997df36c6ad71a9d7e0b52ceee221b2 [9/12] libbpf,bpf: Share BTF relocate-related code with kernel
config: i386-buildonly-randconfig-001-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221805.CeoGYjz6-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221805.CeoGYjz6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221805.CeoGYjz6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/btf.c: In function 'btf_seq_show':
   kernel/bpf/btf.c:7544:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7544 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
         |                             ^~~~~~~~
   kernel/bpf/btf.c: In function 'btf_snprintf_show':
   kernel/bpf/btf.c:7581:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    7581 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
         |         ^~~
   kernel/bpf/btf.c: In function 'btf_populate_kfunc_set':
>> kernel/bpf/btf.c:8251:36: error: implicit declaration of function 'btf_relocate_id'; did you mean 'btf_relocate'? [-Werror=implicit-function-declaration]
    8251 |                 set->pairs[i].id = btf_relocate_id(btf, set->pairs[i].id);
         |                                    ^~~~~~~~~~~~~~~
         |                                    btf_relocate
   cc1: some warnings being treated as errors


vim +8251 kernel/bpf/btf.c

  8155	
  8156	static int btf_populate_kfunc_set(struct btf *btf, enum btf_kfunc_hook hook,
  8157					  const struct btf_kfunc_id_set *kset)
  8158	{
  8159		struct btf_kfunc_hook_filter *hook_filter;
  8160		struct btf_id_set8 *add_set = kset->set;
  8161		bool vmlinux_set = !btf_is_module(btf);
  8162		bool add_filter = !!kset->filter;
  8163		struct btf_kfunc_set_tab *tab;
  8164		struct btf_id_set8 *set;
  8165		u32 set_cnt, i;
  8166		int ret;
  8167	
  8168		if (hook >= BTF_KFUNC_HOOK_MAX) {
  8169			ret = -EINVAL;
  8170			goto end;
  8171		}
  8172	
  8173		if (!add_set->cnt)
  8174			return 0;
  8175	
  8176		tab = btf->kfunc_set_tab;
  8177	
  8178		if (tab && add_filter) {
  8179			u32 i;
  8180	
  8181			hook_filter = &tab->hook_filters[hook];
  8182			for (i = 0; i < hook_filter->nr_filters; i++) {
  8183				if (hook_filter->filters[i] == kset->filter) {
  8184					add_filter = false;
  8185					break;
  8186				}
  8187			}
  8188	
  8189			if (add_filter && hook_filter->nr_filters == BTF_KFUNC_FILTER_MAX_CNT) {
  8190				ret = -E2BIG;
  8191				goto end;
  8192			}
  8193		}
  8194	
  8195		if (!tab) {
  8196			tab = kzalloc(sizeof(*tab), GFP_KERNEL | __GFP_NOWARN);
  8197			if (!tab)
  8198				return -ENOMEM;
  8199			btf->kfunc_set_tab = tab;
  8200		}
  8201	
  8202		set = tab->sets[hook];
  8203		/* Warn when register_btf_kfunc_id_set is called twice for the same hook
  8204		 * for module sets.
  8205		 */
  8206		if (WARN_ON_ONCE(set && !vmlinux_set)) {
  8207			ret = -EINVAL;
  8208			goto end;
  8209		}
  8210	
  8211		/* In case of vmlinux sets, there may be more than one set being
  8212		 * registered per hook. To create a unified set, we allocate a new set
  8213		 * and concatenate all individual sets being registered. While each set
  8214		 * is individually sorted, they may become unsorted when concatenated,
  8215		 * hence re-sorting the final set again is required to make binary
  8216		 * searching the set using btf_id_set8_contains function work.
  8217		 *
  8218		 * For module sets, we need to allocate as we may need to relocate
  8219		 * BTF ids.
  8220		 */
  8221		set_cnt = set ? set->cnt : 0;
  8222	
  8223		if (set_cnt > U32_MAX - add_set->cnt) {
  8224			ret = -EOVERFLOW;
  8225			goto end;
  8226		}
  8227	
  8228		if (set_cnt + add_set->cnt > BTF_KFUNC_SET_MAX_CNT) {
  8229			ret = -E2BIG;
  8230			goto end;
  8231		}
  8232	
  8233		/* Grow set */
  8234		set = krealloc(tab->sets[hook],
  8235			       offsetof(struct btf_id_set8, pairs[set_cnt + add_set->cnt]),
  8236			       GFP_KERNEL | __GFP_NOWARN);
  8237		if (!set) {
  8238			ret = -ENOMEM;
  8239			goto end;
  8240		}
  8241	
  8242		/* For newly allocated set, initialize set->cnt to 0 */
  8243		if (!tab->sets[hook])
  8244			set->cnt = 0;
  8245		tab->sets[hook] = set;
  8246	
  8247		/* Concatenate the two sets */
  8248		memcpy(set->pairs + set->cnt, add_set->pairs, add_set->cnt * sizeof(set->pairs[0]));
  8249		/* Now that the set is copied, update with relocated BTF ids */
  8250		for (i = set->cnt; i < set->cnt + add_set->cnt; i++)
> 8251			set->pairs[i].id = btf_relocate_id(btf, set->pairs[i].id);
  8252	
  8253		set->cnt += add_set->cnt;
  8254	
  8255		sort(set->pairs, set->cnt, sizeof(set->pairs[0]), btf_id_cmp_func, NULL);
  8256	
  8257		if (add_filter) {
  8258			hook_filter = &tab->hook_filters[hook];
  8259			hook_filter->filters[hook_filter->nr_filters++] = kset->filter;
  8260		}
  8261		return 0;
  8262	end:
  8263		btf_free_kfunc_set_tab(btf);
  8264		return ret;
  8265	}
  8266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
