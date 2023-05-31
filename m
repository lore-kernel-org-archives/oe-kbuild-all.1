Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDC510F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 05:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1685509939;
	bh=zzaIU4lnx1jw0A5eH60TYyPEVaJVimzNKfgdI0RVJ7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K0B83avTr+8RCpBSdIiyjetLEtOac1cUGkYcQ3/pOrstNOpJ/IrPxCcw7b2t2w3ZR
	 GGkmLDIf3SVU23WS7PwkxY8JqEw8tsaZ4JV/dore+FBiWrlXgCXDzDNtuRI7RjjPh8
	 vgMzqs8t9Ulq+ywW/OzHSvHBeVjSvB8NdV4cvXZ5bxHWUapz3t8pJbQbuY7kA1cf5B
	 ZPxtn2DpMT9C5PTpsOyePW6fzx9sth11KmPttCwpMEfG4Lpj3tgrnSZv5zVqDfgZVR
	 UXRiiyiz7YIionjmAfdcal0WDokg49V+UEYXX8NXyIV3YY0NdjBLekb3ArNsUAMjf0
	 /ObmU0cvgCXkw==
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.166])
	by gnuweeb.org (Postfix) with ESMTPSA id CBAC223EB4C;
	Wed, 31 May 2023 12:12:17 +0700 (WIB)
Date: Wed, 31 May 2023 12:12:13 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:testing/af/home 3/8]
 kernel/workqueue.c:4421:5: warning: no previous prototype for
 'set_workqueue_cpumask'
Message-ID: <ZHbXLZ1O5DjGtI1Z@biznet-home.integral.gnuweeb.org>
References: <202305310934.bM5gW0SL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305310934.bM5gW0SL-lkp@intel.com>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1

On Wed, May 31, 2023 at 09:24:17AM +0800, kernel test robot wrote:
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305310934.bM5gW0SL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/workqueue.c:4421:5: warning: no previous prototype for 'set_workqueue_cpumask' [-Wmissing-prototypes]
>     4421 | int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
>          |     ^~~~~~~~~~~~~~~~~~~~~

I forgot to add the declaration in the header. The fix below:

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index ac551b8ee7d9f2f4..e3bd6f47e74ecd66 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -710,6 +710,9 @@ int workqueue_online_cpu(unsigned int cpu);
 int workqueue_offline_cpu(unsigned int cpu);
 #endif
 
+int set_workqueue_cpumask(struct workqueue_struct *wq,
+			  const cpumask_var_t mask);
+
 void __init workqueue_init_early(void);
 void __init workqueue_init(void);
 

-- 
Ammar Faizi

