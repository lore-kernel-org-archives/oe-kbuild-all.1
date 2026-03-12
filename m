Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54CB39020C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334580; cv=none; b=aN6k9L5nC502AvBow3AqBVZzulpKT2/HpWFQ1sVMixXlELQ61yVkKuDNxYr48QAlE/eyy5IPSrg40DKbbTk2PqFjIqUfvL3KnIsdOLHk+iM75/NCXdzhk0tMoQnUwMO35koPqOe33kIoJUksh0dWPhKjutJKdnctbGqf3LQNQuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334580; c=relaxed/simple;
	bh=2FIX/z0MA78TQchy8Bl9fzSZSjfi9qD8z5KF77Ky/zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0hQ6koCu/QlRGrKDdUStRigOkvCFd75MPZmWbYIRHI44En2/4Qhey81OXxeQ9XGDI7YG3F8vsQmYqNzKgBBRyOKcVUHndbV9tdb2J35yMyQRUnN3hyIbCtrmDOHNC8b2CpZYKJB4+CR6PJmojYC+lH/4EuuuTnpRPjiszlRLjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY1zDlEw; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY1zDlEw"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d75ed779bfso1377069a34.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Mar 2026 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773334578; x=1773939378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18JIT3O6zukphcEe6SxTxh/vhMczaM3dIFncm+AHYYE=;
        b=BY1zDlEwUWF+h9RM3iLGs55r4zacL9iJVE78zyNPKD2mAd7LSGr01stURxmdGsXHwd
         khnHju6ZdirymzYLAr7uSJWN0rMpWaTw2ZCZdH5TjkO6rp8vIwciSCxneW2p+HSbj4zW
         Phk656eYR+r4ycEBiqj4sbmLgrDkrX94w3kEePj4/nM5JiktX/OXN/XMLWMMpOwonU2j
         PX4um1dbWCly/xDI47PHeCCesVXfB+NYwmC53mnrDHaTOUqaBFTfoTVH9pUPPvfGyhsR
         gjN/U1nqPT6tXoKz1RaiU1Yz1IBFAGWb0SdT/QFJfzYZQtdnjK0VtIbZ9enAJHuItvIM
         X4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334578; x=1773939378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=18JIT3O6zukphcEe6SxTxh/vhMczaM3dIFncm+AHYYE=;
        b=OB4n922jmi1Ax3M6OLPKuphLOujZ3Q6Xuzo8oGSz7xtgyIvIP+Tv5JxJxt65umRjVf
         bzl2B4qNvoelVqUmrkprbD716Xpg8HTtuRoxJ3yLFp7Ssd5GqLs9Ytkf/Fv2YIgaZDnm
         OCZVpPyh7nn1RNi4FGafDI2YEJ6ccaPN9CRO9uWsMQ8Y7YZlxRMDb7CDFoS8+M07inih
         cklfjPNLlE0Sx2+2MOiW+dLxMxgYtzLW9Q31ryEMnX2S7QpOa+N0DmDO7rxNi98VGANC
         QxEdJJQAGizJ217WsFI0b5FB+bO784BZc5n+tHk8kvmefYf5FlEV2I3a4FepVv4EZooY
         jXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBAn4sy51gX5Z22m9AFOYmERmL3v6G0wS1QQvqw51Ms5LTAyNyz65v4vImBXPQcsmk5bjhyxlcKgisZrfg@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6WK68xyuM2jNKFjReenNnETFt51FvK7L5UgHKmaI6FwQWc1Ea
	0JH1aLj7NjePWcwNhIH+fpfAEt6AF5G21qTnYpB8FbzviI729AlFMj8q
X-Gm-Gg: ATEYQzwpuofU66ZqW/JqJQKQNu5f41lhHRjOAyuzJU0ov1LXu2aG2Wjh7H/V/4Hpsck
	gzgziabIXoD30uTXwiykz9hQkXOlJjrmSE28Z6Dm77KjKUCPVpI3fc4ZEiTimJukDP6SwlefdC9
	Rs/T+Qj2LybvK0G7gWm4QIWz2Uuus3cZOHWCo+WJ6Ckewjsgu5zcyq6wK0vf87iC53A8mZgSY1L
	qp7q8baADnrHu4ZsBk6NG1MNzqZ8emm7fysks6KqJoMVIOuzy5gNkU9RPAUQbepBh0pSnFoVe5x
	pyLJHEFn75qEmDxKrL1/VOUyf7V18CdYoYvf0XAclskGZWhyY4S0xwiMFNECG2mI7IH+02Czxoo
	Jlw2F7reQEq20ziZbOZ5C2GljpwFxeN2FehCnLaKb1Sn+wrRGXS4XvIYLNOCTv1zdoZN07ttd8L
	MXQvDei3RSu+aBcWsVLCOhKw==
X-Received: by 2002:a05:6830:64c8:b0:7d7:5b20:16ec with SMTP id 46e09a7af769-7d782466df9mr59235a34.11.1773334577663;
        Thu, 12 Mar 2026 09:56:17 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:57::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aa5dcc7sm4596873a34.0.2026.03.12.09.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:56:17 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 10/11] mm/zsmalloc: Handle single object charge migration in migrate_zspage
Date: Thu, 12 Mar 2026 09:56:14 -0700
Message-ID: <20260312165615.3800716-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <202603121158.g93vlc2U-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 12 Mar 2026 11:51:59 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Joshua,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on axboe/for-next]
> [also build test WARNING on linus/master v7.0-rc3]
> [cannot apply to akpm-mm/mm-everything next-20260311]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260312-035531
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260311195153.4013476-11-joshua.hahnjy%40gmail.com
> patch subject: [PATCH 10/11] mm/zsmalloc: Handle single object charge migration in migrate_zspage
> config: x86_64-randconfig-001-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121158.g93vlc2U-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121158.g93vlc2U-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603121158.g93vlc2U-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/zsmalloc.c:1702:6: warning: variable 's_idx' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>     1702 |         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/zsmalloc.c:1752:45: note: uninitialized use occurs here
>     1752 |         d_zspage->objcgs[d_idx] = s_zspage->objcgs[s_idx];
>          |                                                    ^~~~~
>    mm/zsmalloc.c:1702:2: note: remove the 'if' if its condition is always false
>     1702 |         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1703 |                 goto out;
>          |                 ~~~~~~~~
>    mm/zsmalloc.c:1696:20: note: initialize the variable 's_idx' to silence this warning
>     1696 |         unsigned int s_idx, d_idx;
>          |                           ^
>          |                            = 0
> >> mm/zsmalloc.c:1702:6: warning: variable 'd_idx' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>     1702 |         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/zsmalloc.c:1752:19: note: uninitialized use occurs here
>     1752 |         d_zspage->objcgs[d_idx] = s_zspage->objcgs[s_idx];
>          |                          ^~~~~
>    mm/zsmalloc.c:1702:2: note: remove the 'if' if its condition is always false
>     1702 |         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1703 |                 goto out;
>          |                 ~~~~~~~~
>    mm/zsmalloc.c:1696:27: note: initialize the variable 'd_idx' to silence this warning
>     1696 |         unsigned int s_idx, d_idx;
>          |                                  ^
>          |                                   = 0
>    2 warnings generated.

Hello kernel test robot,

Thank you for catching this issue! Yes, the MEMCG v1 check should be
done after I use obj_to_location to initialize the indices, so that
the objcg pointer swap works at the end.

Will make the change in the next version!
Joshua
