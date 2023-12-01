Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A631C2BA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvO1DNJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701419705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4q0AdlI8u70+zcHRqNWhCtdPcn5B6eukPMIDGuDzozc=;
	b=YvO1DNJd7h0rRQ4RV+ssnBvR7s9QFm9ilx7Vve8k+OKQ2Es9n9gunWdcyuyV+0RePrXOgo
	hj3qofmu4d6VQrts4pYBNO5P2QX1y90aWA0jotwA4hXrTpNWCFZZY3rwa0Cv4iLVzzhdXZ
	pv3eOuYBKvSPS/GtDcJ+KJTkV40P4+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-nnWLiuzrMG29QwrDxG-L-w-1; Fri, 01 Dec 2023 03:35:04 -0500
X-MC-Unique: nnWLiuzrMG29QwrDxG-L-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 039B0101AA50;
	Fri,  1 Dec 2023 08:35:04 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6715F36E2;
	Fri,  1 Dec 2023 08:34:49 +0000 (UTC)
Date: Fri, 1 Dec 2023 16:34:46 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric DeVolder <eric_devolder@yahoo.com>
Subject: Re: [linux-next:pending-fixes 239/291] mipsel-linux-ld:
 kernel/kexec_core.c:undefined reference to `machine_kexec'
Message-ID: <ZWmapoLqHA6Gad8c@MiWiFi-R3L-srv>
References: <202311302042.sn8cDPIX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202311302042.sn8cDPIX-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 11/30/23 at 08:35pm, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
> head:   1867b4f140ac1336fdc9f7989171e230ab3cea6a
> commit: f8ff23429c625c2b2a134d87f490a89a98c544ce [239/291] kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP
> config: mips-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20231130/202311302042.sn8cDPIX-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302042.sn8cDPIX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311302042.sn8cDPIX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mipsel-linux-ld: kernel/kexec_core.o: in function `kimage_free':
> >> kernel/kexec_core.c:(.text+0x2200): undefined reference to `machine_kexec_cleanup'
>    mipsel-linux-ld: kernel/kexec_core.o: in function `__crash_kexec':
> >> kernel/kexec_core.c:(.text+0x2480): undefined reference to `machine_crash_shutdown'
> >> mipsel-linux-ld: kernel/kexec_core.c:(.text+0x2488): undefined reference to `machine_kexec'
>    mipsel-linux-ld: kernel/kexec_core.o: in function `kernel_kexec':
> >> kernel/kexec_core.c:(.text+0x29b8): undefined reference to `machine_shutdown'
>    mipsel-linux-ld: kernel/kexec_core.c:(.text+0x29c0): undefined reference to `machine_kexec'

Thanks for reporting this.

The fix for this issue has been included in below patch.

[PATCH v2] kexec_core: change dependency of object files
https://lore.kernel.org/all/20231201060325.26940-1-bhe@redhat.com/T/#u

