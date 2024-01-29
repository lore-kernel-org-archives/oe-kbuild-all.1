Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54685657C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536112; cv=none; b=T1t+h5Oy1VXM+sDOl2RHyybsHL3SbWEdZQ7AdLB1QtazgMnRgNMvfB2HgPbr95ZamCSbu7tDN6tiOnXZqIItnrXNnJ8zu6bqQQwGvwi7bspDSA4Y7gBZxVLSUh0422JAgtkHmnM2j06Pk71wCh3+FvRSxawnMLJ1OvIR+NwwRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536112; c=relaxed/simple;
	bh=1aOXFycfHcJrh+G4H7H5FPXtv0a3BgLVkGyQApyRNC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WbBUPnbYExijkHIsG+XekyRsR67x95m10HLEr4qIAWNfIwViDBkZzeoaw4rr52gH3+GbKmAJn89/lJm2ePowmEfReyTPnBShbHCcs5HbshCGlayvNPh8Oo+5eYertcDl2Ei6LzuRwrvj76b39BpTydeDejJoIdn9MNIEDUCOMEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZgwH/HQg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZgwH/HQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706536109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzDvfawJd0wb9fLhGTxOrmGsf7+8BpL2pYD1wNX7Ogk=;
	b=ZgwH/HQgCJIUGbTa355pAQt2Ya4dp+SMCBHtmvo/VIaUSvhpD8EeeVO/QUoMzR8j3Bnhw6
	Vss0zzvDA3USMuJ8TNqMJMPi0TXLut0qOkCAl9+HBGcpmeoWCyJG66tcnGtyHQhOFNNzwT
	Tdk4TT4tTPvLCg91qQPWckgf70eMKbU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-ll2YndX8NuOCE0vqp3zkoQ-1; Mon,
 29 Jan 2024 08:48:26 -0500
X-MC-Unique: ll2YndX8NuOCE0vqp3zkoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B44EB299E745;
	Mon, 29 Jan 2024 13:48:25 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E86E40C122E;
	Mon, 29 Jan 2024 13:48:24 +0000 (UTC)
Date: Mon, 29 Jan 2024 21:48:21 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [davidhildenbrand:fork_rmap_batching_mm_unstable 104/141]
 make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by
 'kernel/built-in.a'.
Message-ID: <ZbespUe8SwF7L3g2@MiWiFi-R3L-srv>
References: <202401292018.RTtZWk0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202401292018.RTtZWk0P-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/29/24 at 08:12pm, kernel test robot wrote:
> Hi Baoquan,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://github.com/davidhildenbrand/linux fork_rmap_batching_mm_unstable
> head:   b652ec55c236cca5d0247cf66864971cc2ffea2d
> commit: 21b8f7d4d9d70fec7ff6bbd973e485fa1226b156 [104/141] crash: remove dependency of FA_DUMP on CRASH_DUMP
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292018.RTtZWk0P-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401292018.RTtZWk0P-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
......
> >> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.

This is fixed by Stephen at bottom. Now I can see it on linux-next:

commit 12f1531b9f77 Merge branch 'mm-everything' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

commit 02002068055e2172e49d14f9fb11ab277b8d8094
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Jan 25 09:58:54 2024 +1100

    fix up for "crash: remove dependency of FA_DUMP on CRASH_DUMP"

    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/kernel/crash_dump.c b/kernel/elfcorehdr.c
similarity index 100%
rename from kernel/crash_dump.c
rename to kernel/elfcorehdr.c

