Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748700;
	b=D07zVp65NKnbbzgGVDzyJ2BBZ2GFr8zmKkqjWnzDOp6DpIvWFhnwMVMru8cKAmSugP8J
	 Txz+HE2KTnK0AliYueVBKS+2d82fn03nnjB7wVWLunCj5DTtLbomtmwjA54Cnke/K/y/0
	 hGdcLwfqiAZspaCcnDpoIehyPKyGJrpMCnFhWsYiHUGKYfxonmXXbe3QXzlyBk57e3xy4
	 35xa8icG2Vu+sElbxM40W1RwBCvDzoioWxzvgzza0Bj9Ta3B2oHNyHR0HdrFUsun+wx7X
	 n4SzKSjc2Qwng+heWWxC+nplUtl4cJtxGUk4jmhxfViNDqHN39y12OkBjp03uFrc1/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748700;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0VKcGJjC0XIghfJ07Ncgp/GPkOnHkqrT2/GgddonycI=;
	b=HpcWfPdX6FE/mcepQMeK7xd5uhpF4FK3C3/WlGszirfM4KuMYTLgUKvOHyE3Yx9Fj/tL
	 pOJ94cHWaiDKNsyUx+gQ1biSjk4zwRUgbaUEzGY0qCn5tmYqa4aROnBBRa6YOpGhLGxqX
	 LU+Ep7AKpsy5cyil3aqclMH6DrM0wC9uNhTYLMS9aQ0XP0is/RZTkCnZxlzgjpna8kYJW
	 gGr4Ien/6XpI9MejmN3vRuMRsgdZvSiMU649G/ty8qUgUXnC62MVzVQUwAJb85xhx2DGw
	 I3Vno7s+sebEsWb27Zr0jT7mC69Iy+nlcsTk8obMLPjNzru4xitXU2Fs6zgexaE/nFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfEi8Wom;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17889606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17889606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfEi8Wom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792748699; x=1824284699;
  h=date:from:to:cc:subject:message-id;
  bh=xaNiw2hwbrMV267XA8ufFNjJHn9wxf4xIJ159FYAzGU=;
  b=dfEi8WomIv/RXqZzYKh89ubfvtvBZ+wLsSemAUmI6ansZ1gGSRETCsPy
   GpI6GgZM3h1JwWERedr55PxIysWmxtQt4hmGELGL3gC4Rkt4XgZgH6VDz
   Opu8DXzTjUXE6Lvxh9mMEe3myPrnUqizYTPgrgPEzT9BmX7cvD6NH6gD1
   Er++pNp4iDZWXYPpvCRIgrvkjVdWbsBmKV0tpzWe2NxAhpraeX5F0hGaD
   X0bSV/s1sAKkck0Sbjr5GhnsSIZh8ZyhCXi6c+j6c+N91vRxc/eVxvI3B
   SC7d6PlBJaOZ3TrvzLtRqz8vl10i+SGEQ+SKQxkU9A57WjnmvPSI1mQUx
   A==;
X-CSE-ConnectionGUID: Mxie79g2QUWdIuO+0P3IrQ==
X-CSE-MsgGUID: B7g3MlaZQIm7B76p/NMTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1601202"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1601202"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:44:58 -0700
X-CSE-ConnectionGUID: hafQcMtLT5y+XKyFM1gZtg==
X-CSE-MsgGUID: pLkowOmmTGC6wbZzNKJZMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3944056"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2026 02:44:58 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKBpW-000000000Zr-3Yum;
	Fri, 23 Oct 2026 09:44:54 +0000
Date: Fri, 23 Oct 2026 11:44:51 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [docs:docs-next 97/115] htmldocs:
 Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:361: WARNING:
 Inline emphasis start-string without end-string. [docutils]
Message-ID: <202610231144.X9spCoJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   f857ff5bf007f3394b704e200096571cbffdcc3a
commit: 131006cc650ccf5cbd2d6ac1953a263eb25756ea [97/115] docs: core-api: include documentation from linux/uaccess.h
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.22.4, Python 3.13.5, on linux)
sphinx: sphinx-build 9.1.1
reproduce: (https://download.01.org/0day-ci/archive/20261023/202610231144.X9spCoJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231144.X9spCoJF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./include/linux/uaccess.h:532 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * This is like copy_struct_from_user(), but the
   WARNING: ./include/linux/uaccess.h:556 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   * This is like copy_struct_to_user(), but the
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:363: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:361: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:373: ERROR: Unexpected indentation. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:376: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:453: ERROR: Unexpected indentation. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:451: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:472: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:777: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/core-api/mm-api:11: ./include/linux/uaccess.h:779: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
