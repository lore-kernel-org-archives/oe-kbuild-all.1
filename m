Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C912E4D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 17:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253234; cv=none; b=MwJ25mCvfFLH8Hu46Gn9b+Ury7Y1bEV/2qIATa5epy53xUo1IEIlkFsHDCAXUqbEIkqepZToorxfxSA4tattDtU2shhH6cjP1Cysd0khFKZ4B1AB3xEC0eHzANsz9mD6iEySiWO1Zi4YPillT4Vx4L7uMswuEIzLK781JipRVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253234; c=relaxed/simple;
	bh=MMcUkHlDFXVaqbNtiKCkenn3PkUiF9CXnNNLThdCsAQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Au4R9sjZvK+/qkCx/LIUYJnA10Ba0T9aBy4Di0bRqYAw1KyeEjjD0rD6esRn2Z9eOaX4eCBY7TxkamOsfydvYKy3EXAkLI3U0qmXvtDSpHX93Cw2VS8mLq7sdSg2FIW7lwX8PUdwTqP3r0ujZNTjANG/1ujGwJPLaS/vi6jFf9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZJXqo2n5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZJXqo2n5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EB5C433F1;
	Thu,  4 Apr 2024 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1712253234;
	bh=MMcUkHlDFXVaqbNtiKCkenn3PkUiF9CXnNNLThdCsAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZJXqo2n5aTksSZxug/ipQJc+8UVOmCndmtpp1cEA+8fAA6FP4Bsm6HXHq2YHqAdP+
	 Fnq65FsBtYt3FLBf2pqAIAq7Ajum2wN06b96r2QLDqcXZa5ppTlkJJKRxh+JuTIEG3
	 WVzSKv8YfJDZMEJQ4laXjXdYBBWBQbvXKkakTAH8=
Date: Thu, 4 Apr 2024 10:53:53 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Dan Schatzberg <schatzberg.dan@gmail.com>
Subject: Re: [akpm-mm:mm-unstable 300/300] include/linux/mmdebug.h:114:35:
 error: expected expression before 'do'
Message-Id: <20240404105353.ba7b383d976018512e760eb5@linux-foundation.org>
In-Reply-To: <202404041924.UiccBz3l-lkp@intel.com>
References: <202404041924.UiccBz3l-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Apr 2024 19:31:40 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   e04f729678f630b7304f9a8d5d22819fe589681a
> commit: e04f729678f630b7304f9a8d5d22819fe589681a [300/300] __mod_memcg_lruvec_state(): enhance diagnostics
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041924.UiccBz3l-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041924.UiccBz3l-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404041924.UiccBz3l-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/arm64/include/asm/memory.h:213,
>                     from arch/arm64/include/asm/page.h:46,
>                     from include/linux/page_counter.h:8,
>                     from mm/memcontrol.c:28:
>    mm/memcontrol.c: In function '__mod_memcg_lruvec_state':
> >> include/linux/mmdebug.h:114:35: error: expected expression before 'do'
>      114 | #define VM_WARN_ON_IRQS_ENABLED() do { } while (0)
>          |                                   ^~
>    mm/memcontrol.c:867:29: note: in expansion of macro 'VM_WARN_ON_IRQS_ENABLED'
>      867 |                         if (VM_WARN_ON_IRQS_ENABLED())
>          |                             ^~~~~~~~~~~~~~~~~~~~~~~

Thanks.  Macro is annoying.

--- a/mm/memcontrol.c~__mod_memcg_lruvec_state-enhance-diagnostics-fix
+++ a/mm/memcontrol.c
@@ -864,7 +864,8 @@ void __mod_memcg_lruvec_state(struct lru
 				pr_warn("stat item index: %d\n", idx);
 			break;
 		default:
-			if (VM_WARN_ON_IRQS_ENABLED())
+			VM_WARN_ON_IRQS_ENABLED();
+			if (!irqs_disabled())
 				pr_warn("stat item index: %d\n", idx);
 		}
 	}
_

