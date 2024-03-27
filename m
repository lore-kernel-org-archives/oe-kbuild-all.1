Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBE838385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711537100; cv=none; b=rwxBLsgE99nQSvDVL6QU20W0MwgqasVkrOvi+fsBAwbDc+KRswQIJDmWfxEHTz+ZMSg45oHCfnTV9HvXoL2giqF9xVv2WAdfdxsf2QSWg7vZDEyV6cRCzb1Db5j1BOcZLUQ/nv5LSkIdPnakvmT7Gd/Q8yUGfcZkwZq2shCmv8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711537100; c=relaxed/simple;
	bh=5YGY2JYfdhNoExvpR3rfuPooX1BwtAUW6FizmAqQNG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pW60FV1x94FWOb6Vo6TA5mvooyTAZFCKT25AJ/Npp0Jr1Q3HQAmlv0VizkjFw0IScmNPSAhz0WvWuUjbq0eWmT2rIRehFcBnyiqbxlH9eGSt7kOT7wFKEbhDoKSeSscdoEMVs7rofM+I2udNoMRbM3C98/Tyw/p0LvQ2NGsOMAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBMFDEx5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBMFDEx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711537097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S91u8DyRWZqtyhFVILod0RfK/IbP2pYjnAqixDUfaaA=;
	b=ZBMFDEx5a41ddIU6wameuAG/PpO3r9G7TlosxGCQ5BD9RqMSi/6zLar19PKUHoywsN/4SV
	rqNi70VVNi6oOpok2rXbKJp+/wrgppO9Q18Zmx1MROXUcabpdJjaxv4B2FMAUA0FJVFVpx
	4WHZyajUs3E1rEMsDZT/K2ssn8DCApA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-uIYtmaSXPE6G9Z4cSm9PcQ-1; Wed, 27 Mar 2024 06:58:16 -0400
X-MC-Unique: uIYtmaSXPE6G9Z4cSm9PcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0945C85A58B;
	Wed, 27 Mar 2024 10:58:16 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 506B91121306;
	Wed, 27 Mar 2024 10:58:15 +0000 (UTC)
Date: Wed, 27 Mar 2024 18:58:06 +0800
From: Baoquan He <bhe@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/7] mm/page_alloc.c: remove unneeded codes in !NUMA
 version of build_zonelists()
Message-ID: <ZgP7vpoLyQ+YUrys@MiWiFi-R3L-srv>
References: <20240326061134.1055295-5-bhe@redhat.com>
 <202403270916.8ARzkyqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403270916.8ARzkyqB-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 03/27/24 at 09:53am, kernel test robot wrote:
> Hi Baoquan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-move-array-mem_section-init-code-out-of-memory_present/20240326-141458
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20240326061134.1055295-5-bhe%40redhat.com
> patch subject: [PATCH 4/7] mm/page_alloc.c: remove unneeded codes in !NUMA version of build_zonelists()
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240327/202403270916.8ARzkyqB-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403270916.8ARzkyqB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403270916.8ARzkyqB-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/page_alloc.c: In function 'build_zonelists':
> >> mm/page_alloc.c:5324:19: warning: variable 'local_node' set but not used [-Wunused-but-set-variable]
>     5324 |         int node, local_node;
>          |                   ^~~~~~~~~~
> >> mm/page_alloc.c:5324:13: warning: unused variable 'node' [-Wunused-variable]
>     5324 |         int node, local_node;
>          |             ^~~~

Thanks, below change can fix the warning. Will update and send out v2.

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b60cdcda46d2..b3872063ea63 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5180,12 +5180,9 @@ static void setup_min_slab_ratio(void);
 
 static void build_zonelists(pg_data_t *pgdat)
 {
-	int node, local_node;
 	struct zoneref *zonerefs;
 	int nr_zones;
 
-	local_node = pgdat->node_id;
-
 	zonerefs = pgdat->node_zonelists[ZONELIST_FALLBACK]._zonerefs;
 	nr_zones = build_zonerefs_node(pgdat, zonerefs);
 	zonerefs += nr_zones;

