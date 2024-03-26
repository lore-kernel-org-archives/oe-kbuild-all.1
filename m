Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AE23B1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711450883; cv=none; b=RW1i8Wrfi4uDukSq6doRT60HkpGQHvMxBxaIlvMD+h1OhCkGNyiGDz16eDPzblzv0E3wIKqUH+IFP8/Z7wkv6UqWCHcJyD8Gkshd+Yg9m5icnkmZXpvw9af+boky7QxKOxcRQpbc9mpRD6aYGjQ6UuK7/6SL411+fWyxKUDthJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711450883; c=relaxed/simple;
	bh=7e+iSGGoTTRDwjQti+60Rs3AtsM74fgnUrtOGNawl9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rvWvv7U8Sj9YWvdIt3AA535DYCayyEPdgPHuguOBl4OAaHNA58iWN5WKNR7vN0tHphuYvp5Nhf3mVheVdV5e9Z1yAr5cTFZCoWVw+NMADwL0y0BzxVVE0G77ol+AfIsI44UCA1PrKMzQmDsHVwQ/ebZ9Atomh6jywHv7U3KCARA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEeSIE3k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEeSIE3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711450880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OS9+8KCgImTKZpmWkQmpOX1bGSaDAjfaxoRd1SKIvkQ=;
	b=hEeSIE3kgM+blxdL5/z+44XUM2UeTwQGOVF/DB8r04UZMrJsBBPeSnoa462o2WLHOJH0nV
	jW7Ntk9w4Pqat+F3UDr/CU1TJYqEqiqChu2C/ocOe2HX+zkB5OqJ1uwslWgQjfaIbo0YNN
	Xc3j+2orpbakubyDF76yzBdD9XXqPmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-9LLy6N0pNOK334SU1Lx_mQ-1; Tue, 26 Mar 2024 07:01:16 -0400
X-MC-Unique: 9LLy6N0pNOK334SU1Lx_mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42B14800264;
	Tue, 26 Mar 2024 11:01:16 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2A21121312;
	Tue, 26 Mar 2024 11:01:15 +0000 (UTC)
Date: Tue, 26 Mar 2024 19:01:02 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
Message-ID: <ZgKq7lwLJiH3vGUA@MiWiFi-R3L-srv>
References: <20240325150459.1045407-2-bhe@redhat.com>
 <202403261645.M4PkWdmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403261645.M4PkWdmb-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 03/26/24 at 05:01pm, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on powerpc/fixes linus/master v6.9-rc1]
> [cannot apply to akpm-mm/mm-everything next-20240326]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-mm_init-c-remove-the-useless-dma_reserve/20240325-230756
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> patch link:    https://lore.kernel.org/r/20240325150459.1045407-2-bhe%40redhat.com
> patch subject: [PATCH 1/7] mm/mm_init.c: remove the useless dma_reserve
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240326/202403261645.M4PkWdmb-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261645.M4PkWdmb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403261645.M4PkWdmb-lkp@intel.com/

This patch series is discarded, please skip the testing for it.

