Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6073288C21
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113258; cv=none; b=mqGL9l6LCsTBrkd+sn3VXqoA7dCMc3+JHaZu1KrFuhwnQeEA52o3c5wpIsVygC8qgG0y/MPnFtX8eePTc07rpUUcm6GODnuDYtLgPnbI86kWWZjUjOt1SMwS9a8AvOUg6QvXnw1aF/stYsmiXHs2GlGA+fhjG2/CkpfhvcMPfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113258; c=relaxed/simple;
	bh=GVvYBOvjMKakmWR7Gj2SZYrX5Pa1TbhQxFK6ksuqoz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsaKZaZRh47TnhF71e8cT5Y8ov63JJuBtYjF/WO4+jcaIrZ3uxc3xOddumFxYwbEhBhTefl2GSllXMRUho6nsTcY5hTuQMhgQvHykxaS/ydGDdPq+f5+03KKKUE45zVtTfWT2npB9tcm939UtLQyEGcriKfkhyBR4NcLPe6Cyj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMnhpnvx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMnhpnvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760113257; x=1791649257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVvYBOvjMKakmWR7Gj2SZYrX5Pa1TbhQxFK6ksuqoz4=;
  b=KMnhpnvxW08vD6+ZJvawUR375GkhNkYTfVccOitEg4O5kUlr6kzDSJxT
   g9AgeXqD4QCiayncohJOtweZUUOzWtTKwh8tDedZmmjxDDSIsLxewuR4E
   3QdYsSybGInbM/GZorjsLFKjmD8UNO/4F0Kk/qe2Qns8C1TANQqhTRgiu
   AiTnFaqz8yKgJ3sj4LAkztQI6M688Gxz2eounYkaOlVR4n+a57c03qCdy
   VH+J+/S4OE3oSEQ7h63aZlZRbMK0GGE3kDc8BOe98AttNyJ0K2oSK2912
   s8nsd/bW6VckfT4ZivQnqHt8lFkfKbDH0QjMpGsQAs4a2XWZZDZQRHhg7
   w==;
X-CSE-ConnectionGUID: zi4jW1lUQ7qxr3LaxwvUOQ==
X-CSE-MsgGUID: PGITzFlzS/KELIM3RIf6ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="65991819"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="65991819"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 09:20:56 -0700
X-CSE-ConnectionGUID: MVvVqogQTPeSBf9XbS6t5Q==
X-CSE-MsgGUID: e4fCkCY9SQ2y+vST6hptMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180698360"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 09:20:55 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v7FrQ-000000008M5-3zQB;
	Fri, 10 Oct 2025 16:20:52 +0000
Date: Fri, 10 Oct 2025 18:20:26 +0200
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 13531/13643] fs/smb/client/inode.c:1813:13:
 warning: variable 'sillyname_len' set but not used
Message-ID: <202510101807.rDN0lxjP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b763d4652393c90eaa771a5164502ec9dd965ae
commit: af991ae5d88f7800e5ac60d95c1bb9ca2fb63fa7 [13531/13643] cifs: Fix random name construction for cifs_rename_pending_delete()
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20251010/202510101807.rDN0lxjP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101807.rDN0lxjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101807.rDN0lxjP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/inode.c: In function 'cifs_rename_pending_delete':
>> fs/smb/client/inode.c:1813:13: warning: variable 'sillyname_len' set but not used [-Wunused-but-set-variable]
    1813 |         int sillyname_len;
         |             ^~~~~~~~~~~~~


vim +/sillyname_len +1813 fs/smb/client/inode.c

  1783	
  1784	#ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
  1785	/*
  1786	 * Open the given file (if it isn't already), set the DELETE_ON_CLOSE bit
  1787	 * and rename it to a random name that hopefully won't conflict with
  1788	 * anything else.
  1789	 */
  1790	#define SILLYNAME_PREFIX ".smb"
  1791	#define SILLYNAME_PREFIX_LEN ((unsigned int)sizeof(SILLYNAME_PREFIX) - 1)
  1792	#define SILLYNAME_FILEID_LEN ((unsigned int)sizeof(u64) << 1)
  1793	#define SILLYNAME_COUNTER_LEN ((unsigned int)sizeof(unsigned int) << 1)
  1794	#define SILLYNAME_LEN (SILLYNAME_PREFIX_LEN + \
  1795			SILLYNAME_FILEID_LEN + \
  1796			SILLYNAME_COUNTER_LEN)
  1797	int
  1798	cifs_rename_pending_delete(const char *full_path, struct dentry *dentry,
  1799				   const unsigned int xid)
  1800	{
  1801		int oplock = 0;
  1802		int rc;
  1803		struct cifs_fid fid;
  1804		struct cifs_open_parms oparms;
  1805		struct inode *inode = d_inode(dentry);
  1806		struct cifsInodeInfo *cifsInode = CIFS_I(inode);
  1807		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
  1808		struct tcon_link *tlink;
  1809		struct cifs_tcon *tcon;
  1810		__u32 dosattr, origattr;
  1811		FILE_BASIC_INFO *info_buf = NULL;
  1812		unsigned char sillyname[SILLYNAME_LEN + 1];
> 1813		int sillyname_len;
  1814	
  1815		tlink = cifs_sb_tlink(cifs_sb);
  1816		if (IS_ERR(tlink))
  1817			return PTR_ERR(tlink);
  1818		tcon = tlink_tcon(tlink);
  1819	
  1820		/* construct random name ".smb<inodenum><counter>" */
  1821		while (true) {
  1822			static unsigned int sillycounter; /* globally unique */
  1823			bool sillyname_available = false;
  1824			struct dentry *sdentry = NULL;
  1825	
  1826			sillycounter++;
  1827			sillyname_len = scnprintf(sillyname, sizeof(sillyname),
  1828					 SILLYNAME_PREFIX "%0*llx%0*x",
  1829					 SILLYNAME_FILEID_LEN, (unsigned long long)cifsInode->uniqueid,
  1830					 SILLYNAME_COUNTER_LEN, sillycounter);
  1831			sdentry = lookup_noperm(&QSTR(sillyname), dentry->d_parent);
  1832			if (IS_ERR(sdentry)) {
  1833				rc = -EBUSY;
  1834				goto out;
  1835			}
  1836	
  1837			if (d_inode(sdentry) == NULL) /* need negative lookup */
  1838				sillyname_available = true;
  1839	
  1840			dput(sdentry);
  1841	
  1842			if (sillyname_available)
  1843				break;
  1844		}
  1845	
  1846		/*
  1847		 * We cannot rename the file if the server doesn't support
  1848		 * CAP_INFOLEVEL_PASSTHRU
  1849		 */
  1850		if (!(tcon->ses->capabilities & CAP_INFOLEVEL_PASSTHRU)) {
  1851			rc = -EBUSY;
  1852			goto out;
  1853		}
  1854	
  1855		oparms = (struct cifs_open_parms) {
  1856			.tcon = tcon,
  1857			.cifs_sb = cifs_sb,
  1858			.desired_access = DELETE | FILE_WRITE_ATTRIBUTES,
  1859			.create_options = cifs_create_options(cifs_sb, CREATE_NOT_DIR),
  1860			.disposition = FILE_OPEN,
  1861			.path = full_path,
  1862			.fid = &fid,
  1863		};
  1864	
  1865		rc = CIFS_open(xid, &oparms, &oplock, NULL);
  1866		if (rc != 0)
  1867			goto out;
  1868	
  1869		origattr = cifsInode->cifsAttrs;
  1870		if (origattr == 0)
  1871			origattr |= ATTR_NORMAL;
  1872	
  1873		dosattr = origattr & ~ATTR_READONLY;
  1874		if (dosattr == 0)
  1875			dosattr |= ATTR_NORMAL;
  1876		dosattr |= ATTR_HIDDEN;
  1877	
  1878		/* set ATTR_HIDDEN and clear ATTR_READONLY, but only if needed */
  1879		if (dosattr != origattr) {
  1880			info_buf = kzalloc(sizeof(*info_buf), GFP_KERNEL);
  1881			if (info_buf == NULL) {
  1882				rc = -ENOMEM;
  1883				goto out_close;
  1884			}
  1885			info_buf->Attributes = cpu_to_le32(dosattr);
  1886			rc = CIFSSMBSetFileInfo(xid, tcon, info_buf, fid.netfid,
  1887						current->tgid);
  1888			/* although we would like to mark the file hidden
  1889	 		   if that fails we will still try to rename it */
  1890			if (!rc)
  1891				cifsInode->cifsAttrs = dosattr;
  1892			else
  1893				dosattr = origattr; /* since not able to change them */
  1894		}
  1895	
  1896		/* rename the file */
  1897		rc = CIFSSMBRenameOpenFile(xid, tcon, fid.netfid, sillyname,
  1898					   cifs_sb->local_nls,
  1899					   cifs_remap(cifs_sb));
  1900		if (rc != 0) {
  1901			rc = -EBUSY;
  1902			goto undo_setattr;
  1903		}
  1904	
  1905		/* try to set DELETE_ON_CLOSE */
  1906		if (!test_bit(CIFS_INO_DELETE_PENDING, &cifsInode->flags)) {
  1907			rc = CIFSSMBSetFileDisposition(xid, tcon, true, fid.netfid,
  1908						       current->tgid);
  1909			/*
  1910			 * some samba versions return -ENOENT when we try to set the
  1911			 * file disposition here. Likely a samba bug, but work around
  1912			 * it for now. This means that some cifsXXX files may hang
  1913			 * around after they shouldn't.
  1914			 *
  1915			 * BB: remove this hack after more servers have the fix
  1916			 */
  1917			if (rc == -ENOENT)
  1918				rc = 0;
  1919			else if (rc != 0) {
  1920				rc = -EBUSY;
  1921				goto undo_rename;
  1922			}
  1923			set_bit(CIFS_INO_DELETE_PENDING, &cifsInode->flags);
  1924		}
  1925	
  1926	out_close:
  1927		CIFSSMBClose(xid, tcon, fid.netfid);
  1928	out:
  1929		kfree(info_buf);
  1930		cifs_put_tlink(tlink);
  1931		return rc;
  1932	
  1933		/*
  1934		 * reset everything back to the original state. Don't bother
  1935		 * dealing with errors here since we can't do anything about
  1936		 * them anyway.
  1937		 */
  1938	undo_rename:
  1939		CIFSSMBRenameOpenFile(xid, tcon, fid.netfid, dentry->d_name.name,
  1940					cifs_sb->local_nls, cifs_remap(cifs_sb));
  1941	undo_setattr:
  1942		if (dosattr != origattr) {
  1943			info_buf->Attributes = cpu_to_le32(origattr);
  1944			if (!CIFSSMBSetFileInfo(xid, tcon, info_buf, fid.netfid,
  1945						current->tgid))
  1946				cifsInode->cifsAttrs = origattr;
  1947		}
  1948	
  1949		goto out_close;
  1950	}
  1951	#endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
  1952	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
