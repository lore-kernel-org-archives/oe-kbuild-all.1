Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD02BAF9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 19:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054253; cv=none; b=AznTQIiGv8mYdZMXj2bXvqfTQbxdqxGa9EqAR6EOsja/UVA4TocCBw5u0ZIlqBiYh6FwWDLPmU1gIoX+KKs4ipsFqFzctvFMlA9gplt5ACObJTy3O+WazqudanvhvTNiaaIcOllBXLMJZZrxg7WVVdpNhlsawvxlFg8iOyebVrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054253; c=relaxed/simple;
	bh=vqm101+RY5l2yTnaeVGav3IvP/+hWq0sPlNTLMloFcw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g/5I5+pajKK2SrVfXvNt6U/4w3DbfQH2PwdIfIq8GlcIG58aTu8qiAGRY15TNRyoqNvqi9em2P2zC+F0DcSSKUTIaWPpUYSTXx/84q36IXOb/bCdUrbheWBzB75ihOho2t42zlSTvOLpNrTc/vgVwIn0NlmBKqrjIaMzh9ZljXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gg/2o6z2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gg/2o6z2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E409C4CEE3;
	Fri, 27 Jun 2025 19:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751054252;
	bh=vqm101+RY5l2yTnaeVGav3IvP/+hWq0sPlNTLMloFcw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gg/2o6z2wiAY9J9TMFbzV+iT/p7ouj7bYaGH78k5OHxcS2U4FEpPrQgfV2YQPv7BC
	 mgkbmicLbtE9FQ13CGXhrbX6EhfEzryiVLJZw9t075AIXr57xhGum8AqS6T6PlFjFL
	 Dpa98rqlbXHUT7s5ryDSerMKv87EpVia7kTQZkeo=
Date: Fri, 27 Jun 2025 12:57:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5320/5590] mm/damon/sysfs-schemes.c:1622:32:
 sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should
 it be static?
Message-Id: <20250627125731.19f70c310cb4f315177e41e6@linux-foundation.org>
In-Reply-To: <202506271655.b8yfEZIT-lkp@intel.com>
References: <202506271655.b8yfEZIT-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Jun 2025 16:41:02 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ecb259c4f70dd5c83907809f45bf4dc6869961d7
> commit: 98c5783c468ce5630a0604c69694d04ccc078c02 [5320/5590] mm/damon/sysfs-schemes: decouple from damos_action
> config: hexagon-randconfig-r122-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271655.b8yfEZIT-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
> reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271655.b8yfEZIT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506271655.b8yfEZIT-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> mm/damon/sysfs-schemes.c:1622:32: sparse: sparse: symbol 'damos_sysfs_action_names' was not declared. Should it be static?

Thanks.

--- a/mm/damon/sysfs-schemes.c~mm-damon-sysfs-schemes-decouple-from-damos_action-fix
+++ a/mm/damon/sysfs-schemes.c
@@ -1619,7 +1619,7 @@ struct damos_sysfs_action_name {
 	char *name;
 };
 
-struct damos_sysfs_action_name damos_sysfs_action_names[] = {
+static struct damos_sysfs_action_name damos_sysfs_action_names[] = {
 	{
 		.action = DAMOS_WILLNEED,
 		.name = "willneed",
_

