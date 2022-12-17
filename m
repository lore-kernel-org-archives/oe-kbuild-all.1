Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359D6373
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Dec 2022 01:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671239673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEOj7lSQ2ZgeYSaOTeZ4F4HHem9N0jySn1jpWKoo5ig=;
	b=RFebpp5TKTBrN4djIhixDz9EI8c0NqTLLELZoeldcvEqzpc/5gY0gB3lLB4jYHP4v8mCUu
	jhAbkYIEf2BKQ278y95sTtzLozWx/gek1oJ1BwfH10Z05/hL667bUbpH6SPhdGylz8ztJ4
	imkq2n8SKcnC+U8lc86nHC80N38nf/w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-rJ2yzcc0MLug9guEPquZmw-1; Fri, 16 Dec 2022 20:14:27 -0500
X-MC-Unique: rJ2yzcc0MLug9guEPquZmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE6D53804534;
	Sat, 17 Dec 2022 01:14:26 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE9E7492C14;
	Sat, 17 Dec 2022 01:14:25 +0000 (UTC)
Date: Sat, 17 Dec 2022 09:14:22 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-mm@kvack.org, stephen.s.brennan@oracle.com, urezki@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hch@infradead.org
Subject: Re: [PATCH v1 3/7] mm/vmalloc.c: allow vread() to read out
 vm_map_ram areas
Message-ID: <Y50X7lKtdDn0YTK/@MiWiFi-R3L-srv>
References: <20221204013046.154960-4-bhe@redhat.com>
 <202212041124.bwd5pjCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212041124.bwd5pjCd-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9

On 12/04/22 at 11:47am, kernel test robot wrote:
> Hi Baoquan,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-vmalloc-c-allow-vread-to-read-out-vm_map_ram-areas/20221204-093322
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20221204013046.154960-4-bhe%40redhat.com
> patch subject: [PATCH v1 3/7] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
> config: arm-randconfig-r046-20221204
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/0bcc4ce1e46418b86eb569175879081116649727
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Baoquan-He/mm-vmalloc-c-allow-vread-to-read-out-vm_map_ram-areas/20221204-093322
>         git checkout 0bcc4ce1e46418b86eb569175879081116649727
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/vmalloc.c: In function 'vb_vread':
> >> mm/vmalloc.c:3540:23: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
>     3540 |         unsigned long offset;
>          |                       ^~~~~~

Thanks.

The local variable 'offset' is needed, the handling in vb_vread() need
be improved to cover the case in which reading is started from dirty or
free regions. I will add below change to v2.


diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 78cae59170d8..6612914459cf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3526,7 +3522,6 @@ static void vb_vread(char *buf, char *addr, int count)
 	unsigned long offset;
 	unsigned int rs, re, n;
 
-	offset = ((unsigned long)addr & (VMAP_BLOCK_SIZE - 1)) >> PAGE_SHIFT;
 	vb = xa_load(&vmap_blocks, addr_to_vb_idx((unsigned long)addr));
 
 	spin_lock(&vb->lock);
@@ -3547,16 +3542,22 @@ static void vb_vread(char *buf, char *addr, int count)
 			addr++;
 			count--;
 		}
-		n = (re - rs + 1) << PAGE_SHIFT;
+		/*it could start reading from the middle of used region*/
+		offset = offset_in_page(addr);
+		n = (re - rs + 1) << PAGE_SHIFT - offset;
 		if (n > count)
 			n = count;
-		aligned_vread(buf, start, n);
+		aligned_vread(buf, start+offset, n);
 
 		buf += n;
 		addr += n;
 		count -= n;
 	}
 	spin_unlock(&vb->lock);
+
+	/* zero-fill the left dirty or free regions */
+	if (count)
+		memset(buf, 0, count);
 }
 
 /**

