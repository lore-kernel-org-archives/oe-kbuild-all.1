Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF281727
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 20:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728332538; cv=none; b=OTNdIcQp3KunPvcNcATK7x62f+I6oWLm+QXxcU8SXaJDvbZqYaJal86WgaiWk+vZfbKx2mcwVt3IpVWUumJW47NRbYHwSuZS29SF/8mlBdKw2Jd7fZFWkiK/k4M0p7ho9JZCumxroX/t1voCi6EF2S58w+/dhS+411Mr9DadQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728332538; c=relaxed/simple;
	bh=LWct20uNOK4vtZNRevKYTUb8ExTXvtRe0MU5CS0ZYYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEz9XNM5fDzHiqQAEDFKDyKZfG3BsfuxEs+pixel2oY08TUPuQwyoUYv/LsPgCb1CM+nBr9rDxpi5WhkYkBJPCTNfKo9xTJkACef64l5nZy5CC4LRVNZP2m+AVUrOAAFW2riNQLoNHRfwOhAqWAwUvzp08maJFvGr6wi/B0dD7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UoddkpGT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoddkpGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728332537; x=1759868537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LWct20uNOK4vtZNRevKYTUb8ExTXvtRe0MU5CS0ZYYE=;
  b=UoddkpGTPHoX8ydxibqEot/mFvH6vPpBGdGgm6Noc1mYXigvdnRU2xKu
   qkmkGYzlNFLFkylMfYV34tPBVjy3fUAPnayn0NQGrVOAPHsNqo0BOLmX3
   fSfZ/qflzU/TiiOokQL+3UR9XC/4MgfvGzc3y32JKiFLxBMUQ0lll6u1X
   W7F/fTI/znOBkw5mjRZ81Qh9yua5y2Qc2JAvTMIMVo2AsU5KPFuTFZUQl
   9rLoGhR3/JCsHqfhufpjBOY7bCl1GZqlMBg2Wv6DJb6+brtSVVyN5Y9ci
   9uUbZJgjNqu461887lnFj4y9BhMkdNS7ywk+c6gGQATWJZEKe+E/1HhSs
   A==;
X-CSE-ConnectionGUID: 5BLap9EeQb6fZAuUF1VJJg==
X-CSE-MsgGUID: KJw8H3UrQk+NmIMZUiiPJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="26959681"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="26959681"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 13:22:15 -0700
X-CSE-ConnectionGUID: r1qog4Y4TguWWYtVUVInkg==
X-CSE-MsgGUID: 6iXUtY8ySLa8Ob8mGjIWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75843906"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Oct 2024 13:22:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxuF9-0005Uu-2L;
	Mon, 07 Oct 2024 20:22:11 +0000
Date: Tue, 8 Oct 2024 04:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] cifs: Add support for parsing WSL-style symlinks
Message-ID: <202410080458.o4vvmJkR-lkp@intel.com>
References: <20241006090548.30053-1-pali@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006090548.30053-1-pali@kernel.org>

Hi Pali,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pali-Roh-r/cifs-Add-support-for-parsing-WSL-style-symlinks/20241006-170802
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20241006090548.30053-1-pali%40kernel.org
patch subject: [PATCH] cifs: Add support for parsing WSL-style symlinks
config: x86_64-randconfig-122-20241008 (https://download.01.org/0day-ci/archive/20241008/202410080458.o4vvmJkR-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080458.o4vvmJkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080458.o4vvmJkR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/reparse.c:676:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:676:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:676:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16

vim +676 fs/smb/client/reparse.c

   646	
   647	static int parse_reparse_wsl_symlink(struct reparse_wsl_symlink_data_buffer *buf,
   648					     struct cifs_sb_info *cifs_sb,
   649					     struct cifs_open_info_data *data)
   650	{
   651		int len = le16_to_cpu(buf->ReparseDataLength);
   652		int symname_utf8_len;
   653		__le16 *symname_utf16;
   654		int symname_utf16_len;
   655	
   656		if (len <= sizeof(buf->Flags)) {
   657			cifs_dbg(VFS, "srv returned malformed wsl symlink buffer\n");
   658			return -EIO;
   659		}
   660	
   661		/* PathBuffer is in UTF-8 but without trailing null-term byte */
   662		symname_utf8_len = len - sizeof(buf->Flags);
   663		/*
   664		 * Check that buffer does not contain null byte
   665		 * because Linux cannot process symlink with null byte.
   666		 */
   667		if (strnlen(buf->PathBuffer, symname_utf8_len) != symname_utf8_len) {
   668			cifs_dbg(VFS, "srv returned null byte in wsl symlink target location\n");
   669			return -EIO;
   670		}
   671		symname_utf16 = kzalloc(symname_utf8_len * 2, GFP_KERNEL);
   672		if (!symname_utf16)
   673			return -ENOMEM;
   674		symname_utf16_len = utf8s_to_utf16s(buf->PathBuffer, symname_utf8_len,
   675						    UTF16_LITTLE_ENDIAN,
 > 676						    symname_utf16, symname_utf8_len * 2);
   677		if (symname_utf16_len < 0) {
   678			kfree(symname_utf16);
   679			return symname_utf16_len;
   680		}
   681		symname_utf16_len *= 2; /* utf8s_to_utf16s() returns number of u16 items, not byte length */
   682	
   683		data->symlink_target = cifs_strndup_from_utf16((u8 *)symname_utf16,
   684							       symname_utf16_len, true,
   685							       cifs_sb->local_nls);
   686		kfree(symname_utf16);
   687		if (!data->symlink_target)
   688			return -ENOMEM;
   689	
   690		return 0;
   691	}
   692	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
