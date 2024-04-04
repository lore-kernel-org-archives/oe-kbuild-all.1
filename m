Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1C1350C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261997; cv=none; b=uMCisQ2NwHX9NW8JGwZNmLuAqGeXql5746mB+BUgY9ke3jzVsTr7UUH9XtlbWfvGegQT+3bz18ezmrLhvF9zqqB6+MaGDpSEhw3Ys6Xpg0+HUbSamKLuxRWNtDzkV1EfPogXZ5KJ9CAfYEyFdBn7djsb+5QIKliuM7dHAK6MKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261997; c=relaxed/simple;
	bh=ajSw6TAR8oexEIO5410pu/k+GCT9/HX7QDV7pkoi0uY=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=tJivvPnYPg/xznEWtzatSXQElxjwGTI3Q9yNx7qw92Bsqq8J+iZb3iRq/IHuMUJLUfGJCvp9uk2XkMNAYl7/3wfMEbLUwoNcSAcVMaKHnxE4fIEMocoPl8adAeIMmIpwR5jNZYSq19XbYNYY+0IU8V6gZ5IVc5xKP6Peg81yoa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Z92D4Stc; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Z92D4Stc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/kdsN/mgtgTqBkmER+4H45uRDUQn83rvjEd+cxD8PM=;
  b=Z92D4StchdFVdCctGMoXBS+UkggW88XRDdzyr9lx67meG+akgxsb/OCh
   IBh9BE8i0NK0TTWoxpV8z+ZqB/Kq6lLpBnmqcjeu25Rt5UaGRbfMsAMKy
   KydqOEAi2EodyZN+26URyb1voUEUgE6E46PFD1KKrvjHXptC58EBWGFMU
   Q=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.07,180,1708383600"; 
   d="scan'208";a="83928678"
Received: from 205.153.92.156.ipyx-135073-zyo.above.net (HELO hadrien) ([205.153.92.156])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 22:19:45 +0200
Date: Thu, 4 Apr 2024 16:19:42 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>
cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2674/3921] mm/vmalloc.c:1079:3-9: preceding lock
 on line 1075 (fwd)
Message-ID: <673197af-61f4-669b-e0f2-b229603498f1@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check whether an unlock is needed before the return on line 1079.

julia

---------- Forwarded message ----------
Date: Fri, 5 Apr 2024 04:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2674/3921] mm/vmalloc.c:1079:3-9: preceding lock on
    line 1075

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: 936eedaeacdee6663fa552fc650df4cd4d75d3e4 [2674/3921] mm: vmalloc: fix lockdep warning
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-104-20240405 (https://download.01.org/0day-ci/archive/20240405/202404050445.yVFqmYIK-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404050445.yVFqmYIK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/vmalloc.c:1079:3-9: preceding lock on line 1075

vim +1079 mm/vmalloc.c

f181234a5a21fd Chen Wandun             2021-09-02  1038
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1039) /*
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1040)  * Returns a node where a first VA, that satisfies addr < va_end, resides.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1041)  * If success, a node is locked. A user is responsible to unlock it when a
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1042)  * VA is no longer needed to be accessed.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1043)  *
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1044)  * Returns NULL if nothing found.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1045)  */
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1046) static struct vmap_node *
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1047) find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1048) {
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1049) 	unsigned long va_start_lowest;
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1050) 	struct vmap_node *vn;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1051) 	int i;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1052)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1053) repeat:
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1054) 	for (i = 0, va_start_lowest = 0; i < nr_vmap_nodes; i++) {
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1055) 		vn = &vmap_nodes[i];
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1056)
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1057) 		spin_lock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1058) 		*va = __find_vmap_area_exceed_addr(addr, &vn->busy.root);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1059)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1060) 		if (*va)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1061) 			if (!va_start_lowest || (*va)->va_start < va_start_lowest)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1062) 				va_start_lowest = (*va)->va_start;
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1063) 		spin_unlock(&vn->busy.lock);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1064) 	}
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1065)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1066) 	/*
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1067) 	 * Check if found VA exists, it might it is gone away.
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1068) 	 * In this case we repeat the search because a VA has
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1069) 	 * been removed concurrently thus we need to proceed
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1070) 	 * with next one what is a rare case.
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1071) 	 */
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1072) 	if (va_start_lowest) {
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1073) 		vn = addr_to_node(va_start_lowest);
db64fe02258f15 Nicholas Piggin         2008-10-18  1074
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28 @1075) 		spin_lock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1076) 		*va = __find_vmap_area(va_start_lowest, &vn->busy.root);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  1077
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1078) 		if (*va)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28 @1079) 			return vn;
db64fe02258f15 Nicholas Piggin         2008-10-18  1080
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1081) 		spin_unlock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1082) 		goto repeat;
db64fe02258f15 Nicholas Piggin         2008-10-18  1083  	}
db64fe02258f15 Nicholas Piggin         2008-10-18  1084
db64fe02258f15 Nicholas Piggin         2008-10-18  1085  	return NULL;
db64fe02258f15 Nicholas Piggin         2008-10-18  1086  }
db64fe02258f15 Nicholas Piggin         2008-10-18  1087

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
