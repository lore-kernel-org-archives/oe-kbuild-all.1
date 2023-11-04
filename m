Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2431A584
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFuiZrD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699131474; x=1730667474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xD3w1bNL+ur9+6VloZbIWGyoZwPVfu1r5oIWJE+fszs=;
  b=VFuiZrD35+eE/p0OW63ic006VHor4CX2kfJQLsUiEgSW6Z1sAGR7bbI0
   wEkCALHfsFwNCEX/4O1cdGapB5BXJMWJotfh+xBgvaaqBcySUpDvAHDfI
   FGFT+wmkmZ7EZZuUxnlldNQRmk2i+UW1aSY8CZ80na0DzWZimeQ23tQBv
   R9zZSSmvkg72Eb/uSYUfKont6dCUVdc2mttHK+XeEBR2nSMmZPrejTi5+
   KQWGQKEvQb10E0bPMVPNecwB147i25MUA9k3A+kIjnC1j9An2N6RwVQ92
   IPuKKNvTxqxMSLe2OQLDaUq75tyUOI98P7qoXhYmkk8Luvd3sGSt3Qjfr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="386285114"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="386285114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 13:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="905677787"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="905677787"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2023 13:57:50 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzNiG-0004gS-1P;
	Sat, 04 Nov 2023 20:57:48 +0000
Date: Sun, 5 Nov 2023 04:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-nfs@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lorenzo.bianconi@redhat.com,
	neilb@suse.de, chuck.lever@oracle.com, netdev@vger.kernel.org,
	jlayton@kernel.org, kuba@kernel.org
Subject: Re: [PATCH v4 3/3] NFSD: convert write_ports to netlink command
Message-ID: <202311050409.dPLvgiwN-lkp@intel.com>
References: <153b94db12b5c8fff270706673afffad5d84938c.1699095665.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153b94db12b5c8fff270706673afffad5d84938c.1699095665.git.lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20231103]
[cannot apply to trondmy-nfs/linux-next v6.6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/NFSD-convert-write_threads-to-netlink-command/20231104-202515
base:   linus/master
patch link:    https://lore.kernel.org/r/153b94db12b5c8fff270706673afffad5d84938c.1699095665.git.lorenzo%40kernel.org
patch subject: [PATCH v4 3/3] NFSD: convert write_ports to netlink command
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231105/202311050409.dPLvgiwN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050409.dPLvgiwN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050409.dPLvgiwN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfsctl.c: In function 'nfsd_nl_listener_start_doit':
>> fs/nfsd/nfsctl.c:1877:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1877 |         int ret;
         |             ^~~
--
   fs/nfsd/nfsctl.c:1819: warning: expecting prototype for nfsd_nl_version_get_doit(). Prototype was for nfsd_nl_version_get_dumpit() instead
>> fs/nfsd/nfsctl.c:1901: warning: expecting prototype for nfsd_nl_version_get_dumpit(). Prototype was for nfsd_nl_listener_get_dumpit() instead


vim +/ret +1877 fs/nfsd/nfsctl.c

  1867	
  1868	/**
  1869	 * nfsd_nl_listener_start_doit - start the provided nfs server listener
  1870	 * @skb: reply buffer
  1871	 * @info: netlink metadata and command arguments
  1872	 *
  1873	 * Return 0 on success or a negative errno.
  1874	 */
  1875	int nfsd_nl_listener_start_doit(struct sk_buff *skb, struct genl_info *info)
  1876	{
> 1877		int ret;
  1878	
  1879		if (GENL_REQ_ATTR_CHECK(info, NFSD_A_SERVER_LISTENER_TRANSPORT_NAME) ||
  1880		    GENL_REQ_ATTR_CHECK(info, NFSD_A_SERVER_LISTENER_PORT))
  1881			return -EINVAL;
  1882	
  1883		mutex_lock(&nfsd_mutex);
  1884		ret = ___write_ports_addxprt(genl_info_net(info), get_current_cred(),
  1885				nla_data(info->attrs[NFSD_A_SERVER_LISTENER_TRANSPORT_NAME]),
  1886				nla_get_u32(info->attrs[NFSD_A_SERVER_LISTENER_PORT]));
  1887		mutex_unlock(&nfsd_mutex);
  1888	
  1889		return 0;
  1890	}
  1891	
  1892	/**
  1893	 * nfsd_nl_version_get_dumpit - Handle listener_get dumpit
  1894	 * @skb: reply buffer
  1895	 * @cb: netlink metadata and command arguments
  1896	 *
  1897	 * Returns the size of the reply or a negative errno.
  1898	 */
  1899	int nfsd_nl_listener_get_dumpit(struct sk_buff *skb,
  1900					struct netlink_callback *cb)
> 1901	{
  1902		struct nfsd_net *nn = net_generic(sock_net(skb->sk), nfsd_net_id);
  1903		int i = 0, ret = -ENOMEM;
  1904		struct svc_xprt *xprt;
  1905		struct svc_serv *serv;
  1906	
  1907		mutex_lock(&nfsd_mutex);
  1908	
  1909		serv = nn->nfsd_serv;
  1910		if (!serv) {
  1911			mutex_unlock(&nfsd_mutex);
  1912			return 0;
  1913		}
  1914	
  1915		spin_lock_bh(&serv->sv_lock);
  1916		list_for_each_entry(xprt, &serv->sv_permsocks, xpt_list) {
  1917			void *hdr;
  1918	
  1919			if (i < cb->args[0]) /* already consumed */
  1920				continue;
  1921	
  1922			hdr = genlmsg_put(skb, NETLINK_CB(cb->skb).portid,
  1923					  cb->nlh->nlmsg_seq, &nfsd_nl_family,
  1924					  0, NFSD_CMD_LISTENER_GET);
  1925			if (!hdr)
  1926				goto out;
  1927	
  1928			if (nla_put_string(skb, NFSD_A_SERVER_LISTENER_TRANSPORT_NAME,
  1929					   xprt->xpt_class->xcl_name))
  1930				goto out;
  1931	
  1932			if (nla_put_u32(skb, NFSD_A_SERVER_LISTENER_PORT,
  1933					svc_xprt_local_port(xprt)))
  1934				goto out;
  1935	
  1936			genlmsg_end(skb, hdr);
  1937			i++;
  1938		}
  1939		cb->args[0] = i;
  1940		ret = skb->len;
  1941	out:
  1942		spin_unlock_bh(&serv->sv_lock);
  1943	
  1944		mutex_unlock(&nfsd_mutex);
  1945	
  1946		return ret;
  1947	}
  1948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
