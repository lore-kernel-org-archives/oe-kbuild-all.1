Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D123022541C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Apr 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776545134; cv=none; b=MQH11TOeJpB5JhH47tUuEvQxdy/HEVvfWIOfQJpplJbdrKz7jtGFxjvaGC2BG6gYjpKmddPa09DJdep8ZYwVAKWHvZS/rLki2oI4Qyu/7w1J09CjsTq4ACKNiJpDoQujNF73rAtHV7aGEVuDhrH9ZpyLbrE6CYCXiuz7d4TEXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776545134; c=relaxed/simple;
	bh=YpA7K3FyMvxkFGfBj4YoKfpp0f4JU61NOCW3OLNl3JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWTYaLP63dfxcMdQxwahvCx9U7CPJhRsBYov7rfw1ZBCe/wJHRq8Pp6Ce9/Sw2b0VOfOMbcRMMTNmcqL4ty2h5+4Ii/5h697MNRbp+Mzt6Y5Pi+h+D+cLloNjOPd1Mrq06wjZ/KKa2cOD8V/y8qq+mC61ICPJbmdI6szp/Gy3Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/c4/PSJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/c4/PSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776545133; x=1808081133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YpA7K3FyMvxkFGfBj4YoKfpp0f4JU61NOCW3OLNl3JU=;
  b=l/c4/PSJ02eqynzhNqGezSmQcmgqSdWgM/+GMfMKjTRuL9ky0K1K1hsz
   YS0/DyqyuD6Fr+c7oJL50l213NXsumAdHhA8DnLR3JTWnvUNsK8+zE+t3
   CJc62LoAYUcba45imecyH2UY7T0pNvoWlUh/U+kER6ho8H5t/gCtPevus
   aRQnDpetwKN2jtPG5AOsH7vsgZweNoiZVj4NNkOKJ3NoRplBOwfZzpPKF
   fOLQrj+IxHDEXIBaPJxtP4tCDwEFYGmQEIiRICMwOvMMh8KK/G5iR1T1F
   BrGuAxQsTMWFzN9zGZduLujbYs0TL8OiD7vzzA0VPr1WlzmwHeVfuJeuG
   A==;
X-CSE-ConnectionGUID: SCzsT0SZSOuTMdWKYGbb+w==
X-CSE-MsgGUID: ofVLRF+XQg2KBZZ7gWWDNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77389296"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77389296"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 13:45:32 -0700
X-CSE-ConnectionGUID: Ibezv02vRT6fw+ifg8LiTA==
X-CSE-MsgGUID: I5eUixQ0TwCD0LUXRXOL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="230479876"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 18 Apr 2026 13:45:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wECXe-000000001iP-3Dez;
	Sat, 18 Apr 2026 20:45:26 +0000
Date: Sat, 18 Apr 2026 22:45:25 +0200
From: kernel test robot <lkp@intel.com>
To: Yan Zhu <zhuyan2015@qq.com>, seakeel@gmail.com, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net
Cc: oe-kbuild-all@lists.linux.dev, dzm91@hust.edu.cn,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhuyan2015@qq.com
Subject: Re: [PATCH v3] docs/zh_CN: add module-signing Chinese translation
Message-ID: <202604182216.Qpd5KifK-lkp@intel.com>
References: <tencent_99B2EE128E02C6CC1120DE135D4A2DA5B309@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_99B2EE128E02C6CC1120DE135D4A2DA5B309@qq.com>

Hi Yan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.0 next-20260417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhu/docs-zh_CN-add-module-signing-Chinese-translation/20260418-151621
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/tencent_99B2EE128E02C6CC1120DE135D4A2DA5B309%40qq.com
patch subject: [PATCH v3] docs/zh_CN: add module-signing Chinese translation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260418/202604182216.Qpd5KifK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604182216.Qpd5KifK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/translations/zh_CN/admin-guide/module-signing.rst:157: WARNING: Inline literal start-string without end-string. [docutils]
   Documentation/userspace-api/landlock:480: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.


vim +157 Documentation/translations/zh_CN/admin-guide/module-signing.rst

   152	
   153		openssl req -new -nodes -utf8 -sha256 -days 36500 -batch -x509 \
   154		   -config x509.genkey -outform PEM -out kernel_key.pem \
   155		   -keyout kernel_key.pem
   156	
 > 157	然后可以将生成的 kernel_key.pem 文件的完整路径名指定在
   158	``CONFIG_MODULE_SIG_KEY``选项中，并且将使用其中的证书和密钥而不是自动生成的
   159	密钥对。
   160	
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
