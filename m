Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF815A85A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854451; cv=none; b=YEhE+eej7J78p6xQ9424e0rFOISO5PhWvbmRKcoevvHKQz2iQ7Ruz6C+85/h0pWOCcT00wUe44Dn1rpEM7HgZnAwQ7rZho3LM5M21fqhuI547CkwH33UBGY11uPfZmsLuIviVWjASquNX8gX3bRo3Bo/t2HDKs0/AJJj09eUVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854451; c=relaxed/simple;
	bh=2lqW25Lumrxq1pc6eMR43d6aNRiSlhvKgjWEp0SMRQY=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoKoBewTGjenl+CvWtaz4wB9OlVhhVoPcZhyREqpfgXhDrQ1e1Q06f+1qS5I5VhL99utMqL1Ew6rImQfmgoXjK9EA714hr55WRtVZ7+q+bT56yZvo92Dc4lETmERRF7+afbsIXyI+TjOExRQEwbl20dFaGxEq2bgHI6kOTS/Q+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gobkOgXI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gobkOgXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790854447; x=1822390447;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=2lqW25Lumrxq1pc6eMR43d6aNRiSlhvKgjWEp0SMRQY=;
  b=gobkOgXIVGK61M2KVdWxNOAEBCApHHTqND08VKGVOAmbDxV0D+umy1BC
   CC8gTLkTj6sRi8eQSidbEA6pdnUNZSiejcprcFRxAFO7la/4nA9KVyz50
   VuuR/ll4ICxV9xkOB9qoKVs+aTvk6Kxiry1HdwyyPO0W3Q/XnB/XA3r4g
   HtJa9zK7bvMYdwv5Hrl/D289PHLGzNA8TrGbExY9R/KTaPR4G9AqS2PMz
   k3JTDCyRcvVkRCAsSahSmd5xoTeiLGI0X37wo0kcELqcaRzntFYvye1XA
   aT9uJ3nY9hQfItiPv3GldFwei2OJPL/N174e6CtIvEDTeKCqvsZJpG+wP
   A==;
X-CSE-ConnectionGUID: sDkOyxqOS/WKKmWoQdbRCw==
X-CSE-MsgGUID: LWyAVT+/TwOyyGG+wMWntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90467563"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90467563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 04:34:04 -0700
X-CSE-ConnectionGUID: Xiq4pshRT+2MkI1m01ZxQA==
X-CSE-MsgGUID: Kebpnz2AT1q2+8Ul/Wg3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="284026006"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Oct 2026 04:34:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCF33-00000000Roq-1pYb
	for oe-kbuild-all@lists.linux.dev;
	Thu, 01 Oct 2026 11:34:01 +0000
Date: Thu, 1 Oct 2026 19:33:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: cephfs: Use d_alloc_trylock() in ceph_readdir_prepopulate()
Message-ID: <202610011942.rL8msayo-lkp@intel.com>
References: <202610011942.rL8msayo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610011942.rL8msayo-lkp@intel.com>

Hi NeilBrown,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/cephfs-Use-d_alloc_trylock-in-ceph_readdir_prepopulate/20260929-124739
base:   
patch link:    https://lore.kernel.org/r/202610011942.rL8msayo-lkp%40intel.com
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20261001/202610011942.rL8msayo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011942.rL8msayo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011942.rL8msayo-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/inode.c: In function 'ceph_readdir_prepopulate':
>> fs/ceph/inode.c:2159:22: error: implicit declaration of function 'd_alloc_trylock'; did you mean 'folio_trylock'? [-Wimplicit-function-declaration]
    2159 |                 dn = d_alloc_trylock(parent, &dname);
         |                      ^~~~~~~~~~~~~~~
         |                      folio_trylock
>> fs/ceph/inode.c:2159:20: error: assignment to 'struct dentry *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2159 |                 dn = d_alloc_trylock(parent, &dname);
         |                    ^


vim +2159 fs/ceph/inode.c

  2071	
  2072	int ceph_readdir_prepopulate(struct ceph_mds_request *req,
  2073				     struct ceph_mds_session *session)
  2074	{
  2075		struct dentry *parent = req->r_dentry;
  2076		struct inode *inode = d_inode(parent);
  2077		struct ceph_inode_info *ci = ceph_inode(inode);
  2078		struct ceph_mds_reply_info_parsed *rinfo = &req->r_reply_info;
  2079		struct ceph_client *cl = session->s_mdsc->fsc->client;
  2080		struct qstr dname;
  2081		struct dentry *dn;
  2082		struct inode *in;
  2083		int err = 0, skipped = 0, ret, i;
  2084		u32 frag = le32_to_cpu(req->r_args.readdir.frag);
  2085		u32 last_hash = 0;
  2086		u32 fpos_offset;
  2087		struct ceph_readdir_cache_control cache_ctl = {};
  2088	
  2089		if (test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags))
  2090			return readdir_prepopulate_inodes_only(req, session);
  2091	
  2092		if (rinfo->hash_order) {
  2093			if (req->r_path2) {
  2094				last_hash = ceph_str_hash(ci->i_dir_layout.dl_dir_hash,
  2095							  req->r_path2,
  2096							  strlen(req->r_path2));
  2097				last_hash = ceph_frag_value(last_hash);
  2098			} else if (rinfo->offset_hash) {
  2099				/* mds understands offset_hash */
  2100				WARN_ON_ONCE(req->r_readdir_offset != 2);
  2101				last_hash = le32_to_cpu(req->r_args.readdir.offset_hash);
  2102			}
  2103		}
  2104	
  2105		if (rinfo->dir_dir &&
  2106		    le32_to_cpu(rinfo->dir_dir->frag) != frag) {
  2107			doutc(cl, "got new frag %x -> %x\n", frag,
  2108				    le32_to_cpu(rinfo->dir_dir->frag));
  2109			frag = le32_to_cpu(rinfo->dir_dir->frag);
  2110			if (!rinfo->hash_order)
  2111				req->r_readdir_offset = 2;
  2112		}
  2113	
  2114		if (le32_to_cpu(rinfo->head->op) == CEPH_MDS_OP_LSSNAP) {
  2115			doutc(cl, "%d items under SNAPDIR dn %p\n",
  2116			      rinfo->dir_nr, parent);
  2117		} else {
  2118			doutc(cl, "%d items under dn %p\n", rinfo->dir_nr, parent);
  2119			if (rinfo->dir_dir)
  2120				ceph_fill_dirfrag(d_inode(parent), rinfo->dir_dir);
  2121	
  2122			if (ceph_frag_is_leftmost(frag) &&
  2123			    req->r_readdir_offset == 2 &&
  2124			    !(rinfo->hash_order && last_hash)) {
  2125				/* note dir version at start of readdir so we can
  2126				 * tell if any dentries get dropped */
  2127				req->r_dir_release_cnt =
  2128					atomic64_read(&ci->i_release_count);
  2129				req->r_dir_ordered_cnt =
  2130					atomic64_read(&ci->i_ordered_count);
  2131				req->r_readdir_cache_idx = 0;
  2132			}
  2133		}
  2134	
  2135		cache_ctl.index = req->r_readdir_cache_idx;
  2136		fpos_offset = req->r_readdir_offset;
  2137	
  2138		/* FIXME: release caps/leases if error occurs */
  2139		for (i = 0; i < rinfo->dir_nr; i++) {
  2140			struct ceph_mds_reply_dir_entry *rde = rinfo->dir_entries + i;
  2141			struct ceph_vino tvino;
  2142	
  2143			dname = QSTR_LEN(rde->name, rde->name_len);
  2144	
  2145			tvino.ino = le64_to_cpu(rde->inode.in->ino);
  2146			tvino.snap = le64_to_cpu(rde->inode.in->snapid);
  2147	
  2148			if (rinfo->hash_order) {
  2149				u32 hash = ceph_frag_value(rde->raw_hash);
  2150				if (hash != last_hash)
  2151					fpos_offset = 2;
  2152				last_hash = hash;
  2153				rde->offset = ceph_make_fpos(hash, fpos_offset++, true);
  2154			} else {
  2155				rde->offset = ceph_make_fpos(frag, fpos_offset++, false);
  2156			}
  2157	
  2158	retry_lookup:
> 2159			dn = d_alloc_trylock(parent, &dname);
  2160			doutc(cl, "d_alloc_trylock on parent=%p name=%.*s got %p\n",
  2161			      parent, dname.len, dname.name, dn);
  2162			if (dn == ERR_PTR(-EWOULDBLOCK)) {
  2163				/* Some other thread is working on this name */
  2164				continue;
  2165			} else if (IS_ERR(dn)) {
  2166				doutc(cl, "d_alloc_trylock badness\n");
  2167				err = PTR_ERR(dn);
  2168				goto out;
  2169			} else if (d_in_lookup(dn) && rde->is_nokey) {
  2170				spin_lock(&dn->d_lock);
  2171				dn->d_flags |= DCACHE_NOKEY_NAME;
  2172				spin_unlock(&dn->d_lock);
  2173			} else if (d_really_is_positive(dn) &&
  2174				   (ceph_ino(d_inode(dn)) != tvino.ino ||
  2175				    ceph_snap(d_inode(dn)) != tvino.snap)) {
  2176				struct ceph_dentry_info *di = ceph_dentry(dn);
  2177				doutc(cl, " dn %p points to wrong inode %p\n",
  2178				      dn, d_inode(dn));
  2179	
  2180				spin_lock(&dn->d_lock);
  2181				if (di->offset > 0 &&
  2182				    di->lease_shared_gen ==
  2183				    atomic_read(&ci->i_shared_gen)) {
  2184					__ceph_dir_clear_ordered(ci);
  2185					di->offset = 0;
  2186				}
  2187				spin_unlock(&dn->d_lock);
  2188	
  2189				d_delete(dn);
  2190				dput(dn);
  2191				goto retry_lookup;
  2192			}
  2193	
  2194			/* inode */
  2195			if (d_really_is_positive(dn)) {
  2196				in = d_inode(dn);
  2197			} else {
  2198				in = ceph_get_inode(parent->d_sb, tvino, NULL);
  2199				if (IS_ERR(in)) {
  2200					doutc(cl, "new_inode badness\n");
  2201					d_lookup_done(dn);
  2202					d_drop(dn);
  2203					dput(dn);
  2204					err = PTR_ERR(in);
  2205					goto out;
  2206				}
  2207			}
  2208	
  2209			ret = ceph_fill_inode(in, NULL, &rde->inode, NULL, session,
  2210					      -1, &req->r_caps_reservation);
  2211			if (ret < 0) {
  2212				pr_err_client(cl, "badness on %p %llx.%llx\n", in,
  2213					      ceph_vinop(in));
  2214				if (d_really_is_negative(dn)) {
  2215					if (inode_state_read_once(in) & I_NEW) {
  2216						ihold(in);
  2217						discard_new_inode(in);
  2218					}
  2219					iput(in);
  2220				}
  2221				d_drop(dn);
  2222				err = ret;
  2223				goto next_item;
  2224			}
  2225			if (inode_state_read_once(in) & I_NEW)
  2226				unlock_new_inode(in);
  2227	
  2228			if (d_in_lookup(dn) || d_really_is_negative(dn)) {
  2229				if (ceph_security_xattr_deadlock(in)) {
  2230					doutc(cl, " skip splicing dn %p to inode %p"
  2231					      " (security xattr deadlock)\n", dn, in);
  2232					iput(in);
  2233					skipped++;
  2234					goto next_item;
  2235				}
  2236	
  2237				err = splice_dentry(&dn, in);
  2238				if (err < 0)
  2239					goto next_item;
  2240			}
  2241	
  2242			ceph_dentry(dn)->offset = rde->offset;
  2243	
  2244			update_dentry_lease(d_inode(parent), dn,
  2245					    rde->lease, req->r_session,
  2246					    req->r_request_started);
  2247	
  2248			if (err == 0 && skipped == 0 && cache_ctl.index >= 0) {
  2249				ret = fill_readdir_cache(d_inode(parent), dn,
  2250							 &cache_ctl, req);
  2251				if (ret < 0)
  2252					err = ret;
  2253			}
  2254	next_item:
  2255			d_lookup_done(dn);
  2256			dput(dn);
  2257		}
  2258	out:
  2259		if (err == 0 && skipped == 0) {
  2260			set_bit(CEPH_MDS_R_DID_PREPOPULATE, &req->r_req_flags);
  2261			req->r_readdir_cache_idx = cache_ctl.index;
  2262		}
  2263		ceph_readdir_cache_release(&cache_ctl);
  2264		doutc(cl, "done\n");
  2265		return err;
  2266	}
  2267	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
