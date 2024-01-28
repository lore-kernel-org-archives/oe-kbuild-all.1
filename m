Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5EE23748
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706447068; cv=none; b=N/n9CAW8oXDoPfImA962XxIGSA+gWZWooyWb9qgNgqyAq6qK2AnriVnzY1Lmx4+aTwYIYuy9U2a1OdQjBU6dXb6u5/fIEnVUKGBykD2BwmiDJHWg7Ty4rws1Jf6W5StzuJARcXlv+W4PhoS+IrWvIizSd41cStm4nrXnyWooDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706447068; c=relaxed/simple;
	bh=HS70Zj0p9y7eeOlbmDLmOq/JjDgmA6myGgCcmfp7IV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Pfp9FvsxIsmQlZ2PgyzmFzO3ERso5J6nCMCtfVKTXhoY6pvIRVb7riVI+UgZCzzCDo9TUlw/3qC+zndPhPwOtUHX6zKXBNRpTWJI+QcqqfUz9YD+IpmSE+1c25GBzF86ii8xQjFbwAZifuEfUqxntIewpYyDyw6BqqqMmP+ROYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXJzBvVI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXJzBvVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706447064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8M4zGjdotGe3espZL9fInieuIhFPjXXLt93UeiOvGvk=;
	b=PXJzBvVIkJDAmhsX4cfeJ0SkO0gP38L32dYvlJWMk+1582VkC+SaZmKFfTZBh1ZrIrainv
	O5oUpS2+6eMNOPM694Z1V9i5z5gMgCtfWBqFzXdbiBiGAg5reXRoeFXSExr/daPLMIe+23
	oYBl3Xb2/l5BRJwYELBz4bjtJWTx2H4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-cTGXe2kQOHWDPDAOt1FUyg-1; Sun,
 28 Jan 2024 08:04:23 -0500
X-MC-Unique: cTGXe2kQOHWDPDAOt1FUyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE0D29AC014;
	Sun, 28 Jan 2024 13:04:22 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7902400D5CD;
	Sun, 28 Jan 2024 13:04:21 +0000 (UTC)
Date: Sun, 28 Jan 2024 21:04:12 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 1570/1892] make[4]: *** No rule to make
 target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
Message-ID: <ZbZQzE58IaM/qzj1@MiWiFi-R3L-srv>
References: <202401280724.R6lQ6tyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202401280724.R6lQ6tyY-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/28/24 at 07:53am, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
> commit: 1777bfb42f560d0f1d4f8c31ba86423ac4166f43 [1570/1892] crash: remove dependency of FA_DUMP on CRASH_DUMP
> config: i386-buildonly-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280724.R6lQ6tyY-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280724.R6lQ6tyY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401280724.R6lQ6tyY-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 01af33cc9894b4489fb68fa35c40e9fe85df63dc builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
>    make[4]: Target 'kernel/' not remade because of errors.

This has been fixed by Stephen with below commit in next tree.

commit 02002068055e2172e49d14f9fb11ab277b8d8094
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Thu Jan 25 09:58:54 2024 +1100

    fix up for "crash: remove dependency of FA_DUMP on CRASH_DUMP"
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/kernel/crash_dump.c b/kernel/elfcorehdr.c
similarity index 100%
rename from kernel/crash_dump.c
rename to kernel/elfcorehdr.c

