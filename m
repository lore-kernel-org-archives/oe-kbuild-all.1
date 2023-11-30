Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD55FEE3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 23:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBq75RWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701385748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aQW6NFCdl2OA3vb3Gc76vsXxYecvpMBt+ToO9QFH90Y=;
	b=IBq75RWa4x4PAmO78/YPBPET6tCOzN0p16GrJzBFYh0o8wTwOnSaYO600GVkhiLmtu7UE7
	ZE6jdkhkYLMupiYTYNYZPZUtaUXf+TArcSsNOfOxPIC0tL429m5fEp4GaA0rCgBqFaqumn
	FOWV36wpeGsq8owMvPs/DISDDcbxfMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-S2sy7vr6Py-2CV54Xhxbxg-1; Thu, 30 Nov 2023 18:09:06 -0500
X-MC-Unique: S2sy7vr6Py-2CV54Xhxbxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C93D101AA44;
	Thu, 30 Nov 2023 23:09:06 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B081940C6EBA;
	Thu, 30 Nov 2023 23:09:05 +0000 (UTC)
Date: Fri, 1 Dec 2023 07:09:02 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Eric DeVolder <eric_devolder@yahoo.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [akpm-mm:mm-unstable 25/192] loongarch64-linux-ld:
 kexec_core.c:undefined reference to `machine_kexec'
Message-ID: <ZWkWDg41Q5eGuNU4@MiWiFi-R3L-srv>
References: <202311300946.kHE9Iu71-lkp@intel.com>
 <ZWhLFDC6vHsxNCpY@MiWiFi-R3L-srv>
 <20231130085335.09e1db227e3a99e1f70e7748@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20231130085335.09e1db227e3a99e1f70e7748@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/30/23 at 08:53am, Andrew Morton wrote:
> On Thu, 30 Nov 2023 16:43:00 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > There are several places in m68k, mips, sh architecture which have the
> > similar issue. Would you prefer one patch to contain them all or
> > separate patches for each architecture's fix?
> 
> Doesn't matter much.  I guess a single patch would save some electrons.

Sure, will post one patch to include them all. Thanks.

