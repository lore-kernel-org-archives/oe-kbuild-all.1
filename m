Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A2352007
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 05:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550813; cv=none; b=fOmrI+YeYuqtF5dWqVyz+2NevekwoJOTvFhnApoqPo+jyNnOfouoUqG6aoMBb6iZ1Di3Gy9IPjU40hNkkp5/THRxyCHkOMePx+G6E7FyhB8/hUnTzQSrU4Hbry0BJQEyvwcRZ5nj0C0Fm7T60lWg82W1oezRmddaNp1M8ReBwps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550813; c=relaxed/simple;
	bh=sVrfIy0j5BMRI+BAnneTCOjRGJgbbMszegrPykf2t9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ga49dzDW3TWsfUHf/2ja5M+cfLgmtmCgv5ux3ZzhBkXaP8thLgtnsaorOLRqJFdv9qRmYTF0Z1nFku9snI9Z2Xp3QFpbkLMTPsDCVU6quVA7T5A5wq0jhkK4oR1XOyFdTRsf1Q9l8Vi8tSYBY/hAZZw2sgGe5rUq+pS5tMpRVZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=lIlRE1LN; arc=none smtp.client-ip=95.215.58.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="lIlRE1LN"
X-Envelope-To: oe-kbuild-all@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=sVrfIy0j5BMRI+BAnneTCOjRGJgbbMszegrPykf2t9A=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787550809; v=1; x=1788155609;
 b=lIlRE1LNEiGWv49qjWKOZSSbbepixHi+lGJ05rbn7idJzmk1YrOD010/eJRB3j9z7jwK5O/2
 /PqkK2IJQ2gcxJxnUUlw0Tfbx6Vpyl+nhzHTVJNcu0FOhri0+skCOfkTHknPet0ElIlCTfJM2YP
 lBhqWEaZNLwey5C3yNLq8xFikhJhJs5+I4vHqYU/y7Ce8YFbuUMs1neEeOw4LYEB11069y1eUvf
 A2PYNiJLvKEIVuZkct/EmM803+ULSIh+yWAYdWk6nKgDyejAbpXwXj1yDOKULUv9B8IhlzngjJL
 zmd9St4jkiIhL0K37i9z2nMiZaMrgRs2hJrT8ozdCUGug==
X-Envelope-To: oe-kbuild-all@lists.linux.dev
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id e331f9a19a8a276a;
	Mon, 24 Aug 2026 05:53:29 +0000
X-Mizu-Trace-ID: e331f9a19a8a276a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 13:53:22 +0800
From: Weijie Yuan <wy@wyuan.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: htmldocs:
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst:773:
 WARNING: duplicate label kernel_org_trust_repository, other instance in
 Documentation/process/maintainer-pgp-guide.rst
Message-ID: <aovcUs2jAbjN9Htl@wyuan.org>
References: <202608240726.cBe6kj27-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202608240726.cBe6kj27-lkp@intel.com>

On Mon, Aug 24, 2026 at 07:08:56AM +0200, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Weijie-Yuan/docs-zh_CN-clarify-free-Nitrokey-requirements/20260821-011321
> head:   a88007053f65ab396839b4e3084e6925a9be0894
> commit: a88007053f65ab396839b4e3084e6925a9be0894 docs/zh_CN: add kernel.org trust repository reference
> date:   3 days ago
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> reproduce: (https://download.01.org/0day-ci/archive/20260824/202608240726.cBe6kj27-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608240726.cBe6kj27-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>    WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params' (did you mean one of: 'flags', 'offset')
>    WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
>    WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' description in 'landlock_layer' (did you mean one of: 'flags.quiet')
>    WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' description in 'landlock_layer' (did you mean one of: 'flags.quiet')
> >> Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst:773: WARNING: duplicate label kernel_org_trust_repository, other instance in Documentation/process/maintainer-pgp-guide.rst
>    Documentation/userspace-api/landlock:550: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
> 
> 
> vim +773 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> 
> a88007053f65ab Weijie Yuan 2026-08-21  771  
> 87ef333c0c046b Yanteng Si  2023-11-20  772  使用 kernel.org 信任网仓库
> 87ef333c0c046b Yanteng Si  2023-11-20 @773  --------------------------
> 87ef333c0c046b Yanteng Si  2023-11-20  774  
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks, fixed in v2.
