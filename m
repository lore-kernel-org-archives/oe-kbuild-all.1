Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D77C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 08:40:47 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.169])
	by gnuweeb.org (Postfix) with ESMTPSA id 62A648312D;
	Sat, 25 Feb 2023 08:40:45 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1677314446;
	bh=p9HwdfjkElWxoFWFy1tl0hRSuHMXkbOe3XqHR9OU/mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPiIxo0jxXP0aE64dzxv7IG9nZta32HSwfqbJzAcDqT3D/UAgxXYDrsKybKuC/7lN
	 xRqcS1BOh5W7/qyOXZBGONolh4ip9RLuWmWwGvR/TSXaRKn/FTCvWhpM2mHlPZLlLj
	 YBOZleb8nBq8NLHC6U5K/3ML7cxW5KPNpEywHCM7FZzTjKob9kMHHvqxVfarC/YoTJ
	 1/3IPoReSNi6TLJYk95c3vQNemRnIWpHv08H3IaiU6qvtbsmEmfPv0vUfEXwx8lg5m
	 64TNjyG10HkC7+c+ghRJxfg7t+gPAdLZ2y/mq5HlBeSLvw+BnJG1MNiMbVbeLYkvAe
	 ZjjF3e0vjRbEA==
Date: Sat, 25 Feb 2023 15:40:41 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:af/dev.btrfs 10/11] fs/btrfs/fs.h:173:56:
 warning: left shift count >= width of type
Message-ID: <Y/nJiX8cthAD4kd4@biznet-home.integral.gnuweeb.org>
References: <202302251144.IPOtICDl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302251144.IPOtICDl-lkp@intel.com>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1

On Sat, Feb 25, 2023 at 11:26:21AM +0800, kernel test robot wrote:
> >> fs/btrfs/fs.h:173:56: warning: left shift count >= width of type [-Wshift-count-overflow]
>      173 |         BTRFS_MOUNT_WQ_CPU_SET                  = (1UL << 32),
>          |                                                        ^~

Got it, in that system, unsigned long is 32-bit. So it overflows.

-- 
Ammar Faizi

