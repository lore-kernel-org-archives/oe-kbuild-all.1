Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6ED10FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677783391; x=1709319391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eD0fjIj6NkBl2X1F+uJpNcMlh/Xls/IPenAVTKt+SEk=;
  b=KUw6WuaZYIswIGEKFOZa2MNwPimMpHQ90cTl2Y6KCtqRssUOpwkAzBwQ
   sTlAmHIJ1P2wDZ2PzcVij7e2nUyLtdk13Fh7MEDWxMtzbdU73KQqkPifz
   K/+PB357ruSeqOHt+eEGZC+Yif4566dc449buw+yJuilyq52DEaIeDelk
   GLYRhUb5ISPkEi7KOeorBtga/M1Jt/AMGkCnG+ENhfm/vesU+vjkYK59D
   0aaejSOkrFdEHFpOfgWNmVka+B95SJLXVk5lSd07lzAXpDgjvrn1Jf5i5
   4CNQiQ93Pfy1aX7rR+zx0r22hVgWoygHDQomEy0vJC0dg/L9XQzkKOkV+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="362411874"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="362411874"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 10:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="920822864"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="920822864"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2023 10:56:29 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXo6O-0000nK-2y;
	Thu, 02 Mar 2023 18:56:28 +0000
Date: Fri, 3 Mar 2023 02:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:ksmbd-for-next-next 2/2] fs/ksmbd/smb2pdu.c:4941:42:
 sparse: sparse: invalid assignment: |=
Message-ID: <202303030232.TF5A2Q2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
head:   41ab2e2f3e0f32379d61f3ff31966bdf37a2b420
commit: 41ab2e2f3e0f32379d61f3ff31966bdf37a2b420 [2/2] ksmbd: set FILE_NAMED_STREAMS attribute in FS_ATTRIBUTE_INFORMATION
config: loongarch-randconfig-s033-20230302 (https://download.01.org/0day-ci/archive/20230303/202303030232.TF5A2Q2F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add samba-ksmbd git://git.samba.org/ksmbd.git
        git fetch --no-tags samba-ksmbd ksmbd-for-next-next
        git checkout 41ab2e2f3e0f32379d61f3ff31966bdf37a2b420
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/net/ethernet/sfc/ fs/ksmbd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030232.TF5A2Q2F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ksmbd/smb2pdu.c:4941:42: sparse: sparse: invalid assignment: |=
>> fs/ksmbd/smb2pdu.c:4941:42: sparse:    left side has type restricted __le32
>> fs/ksmbd/smb2pdu.c:4941:42: sparse:    right side has type int

vim +4941 fs/ksmbd/smb2pdu.c

  4881	
  4882	static int smb2_get_info_filesystem(struct ksmbd_work *work,
  4883					    struct smb2_query_info_req *req,
  4884					    struct smb2_query_info_rsp *rsp)
  4885	{
  4886		struct ksmbd_session *sess = work->sess;
  4887		struct ksmbd_conn *conn = work->conn;
  4888		struct ksmbd_share_config *share = work->tcon->share_conf;
  4889		int fsinfoclass = 0;
  4890		struct kstatfs stfs;
  4891		struct path path;
  4892		int rc = 0, len;
  4893		int fs_infoclass_size = 0;
  4894	
  4895		rc = kern_path(share->path, LOOKUP_NO_SYMLINKS, &path);
  4896		if (rc) {
  4897			pr_err("cannot create vfs path\n");
  4898			return -EIO;
  4899		}
  4900	
  4901		rc = vfs_statfs(&path, &stfs);
  4902		if (rc) {
  4903			pr_err("cannot do stat of path %s\n", share->path);
  4904			path_put(&path);
  4905			return -EIO;
  4906		}
  4907	
  4908		fsinfoclass = req->FileInfoClass;
  4909	
  4910		switch (fsinfoclass) {
  4911		case FS_DEVICE_INFORMATION:
  4912		{
  4913			struct filesystem_device_info *info;
  4914	
  4915			info = (struct filesystem_device_info *)rsp->Buffer;
  4916	
  4917			info->DeviceType = cpu_to_le32(stfs.f_type);
  4918			info->DeviceCharacteristics = cpu_to_le32(0x00000020);
  4919			rsp->OutputBufferLength = cpu_to_le32(8);
  4920			inc_rfc1001_len(work->response_buf, 8);
  4921			fs_infoclass_size = FS_DEVICE_INFORMATION_SIZE;
  4922			break;
  4923		}
  4924		case FS_ATTRIBUTE_INFORMATION:
  4925		{
  4926			struct filesystem_attribute_info *info;
  4927			size_t sz;
  4928	
  4929			info = (struct filesystem_attribute_info *)rsp->Buffer;
  4930			info->Attributes = cpu_to_le32(FILE_SUPPORTS_OBJECT_IDS |
  4931						       FILE_PERSISTENT_ACLS |
  4932						       FILE_UNICODE_ON_DISK |
  4933						       FILE_CASE_PRESERVED_NAMES |
  4934						       FILE_CASE_SENSITIVE_SEARCH |
  4935						       FILE_SUPPORTS_BLOCK_REFCOUNTING);
  4936	
  4937			info->Attributes |= cpu_to_le32(server_conf.share_fake_fscaps);
  4938	
  4939			if (test_share_config_flag(work->tcon->share_conf,
  4940			    KSMBD_SHARE_FLAG_STREAMS))
> 4941				info->Attributes |= FILE_NAMED_STREAMS;
  4942	
  4943			info->MaxPathNameComponentLength = cpu_to_le32(stfs.f_namelen);
  4944			len = smbConvertToUTF16((__le16 *)info->FileSystemName,
  4945						"NTFS", PATH_MAX, conn->local_nls, 0);
  4946			len = len * 2;
  4947			info->FileSystemNameLen = cpu_to_le32(len);
  4948			sz = sizeof(struct filesystem_attribute_info) - 2 + len;
  4949			rsp->OutputBufferLength = cpu_to_le32(sz);
  4950			inc_rfc1001_len(work->response_buf, sz);
  4951			fs_infoclass_size = FS_ATTRIBUTE_INFORMATION_SIZE;
  4952			break;
  4953		}
  4954		case FS_VOLUME_INFORMATION:
  4955		{
  4956			struct filesystem_vol_info *info;
  4957			size_t sz;
  4958			unsigned int serial_crc = 0;
  4959	
  4960			info = (struct filesystem_vol_info *)(rsp->Buffer);
  4961			info->VolumeCreationTime = 0;
  4962			serial_crc = crc32_le(serial_crc, share->name,
  4963					      strlen(share->name));
  4964			serial_crc = crc32_le(serial_crc, share->path,
  4965					      strlen(share->path));
  4966			serial_crc = crc32_le(serial_crc, ksmbd_netbios_name(),
  4967					      strlen(ksmbd_netbios_name()));
  4968			/* Taking dummy value of serial number*/
  4969			info->SerialNumber = cpu_to_le32(serial_crc);
  4970			len = smbConvertToUTF16((__le16 *)info->VolumeLabel,
  4971						share->name, PATH_MAX,
  4972						conn->local_nls, 0);
  4973			len = len * 2;
  4974			info->VolumeLabelSize = cpu_to_le32(len);
  4975			info->Reserved = 0;
  4976			sz = sizeof(struct filesystem_vol_info) - 2 + len;
  4977			rsp->OutputBufferLength = cpu_to_le32(sz);
  4978			inc_rfc1001_len(work->response_buf, sz);
  4979			fs_infoclass_size = FS_VOLUME_INFORMATION_SIZE;
  4980			break;
  4981		}
  4982		case FS_SIZE_INFORMATION:
  4983		{
  4984			struct filesystem_info *info;
  4985	
  4986			info = (struct filesystem_info *)(rsp->Buffer);
  4987			info->TotalAllocationUnits = cpu_to_le64(stfs.f_blocks);
  4988			info->FreeAllocationUnits = cpu_to_le64(stfs.f_bfree);
  4989			info->SectorsPerAllocationUnit = cpu_to_le32(1);
  4990			info->BytesPerSector = cpu_to_le32(stfs.f_bsize);
  4991			rsp->OutputBufferLength = cpu_to_le32(24);
  4992			inc_rfc1001_len(work->response_buf, 24);
  4993			fs_infoclass_size = FS_SIZE_INFORMATION_SIZE;
  4994			break;
  4995		}
  4996		case FS_FULL_SIZE_INFORMATION:
  4997		{
  4998			struct smb2_fs_full_size_info *info;
  4999	
  5000			info = (struct smb2_fs_full_size_info *)(rsp->Buffer);
  5001			info->TotalAllocationUnits = cpu_to_le64(stfs.f_blocks);
  5002			info->CallerAvailableAllocationUnits =
  5003						cpu_to_le64(stfs.f_bavail);
  5004			info->ActualAvailableAllocationUnits =
  5005						cpu_to_le64(stfs.f_bfree);
  5006			info->SectorsPerAllocationUnit = cpu_to_le32(1);
  5007			info->BytesPerSector = cpu_to_le32(stfs.f_bsize);
  5008			rsp->OutputBufferLength = cpu_to_le32(32);
  5009			inc_rfc1001_len(work->response_buf, 32);
  5010			fs_infoclass_size = FS_FULL_SIZE_INFORMATION_SIZE;
  5011			break;
  5012		}
  5013		case FS_OBJECT_ID_INFORMATION:
  5014		{
  5015			struct object_id_info *info;
  5016	
  5017			info = (struct object_id_info *)(rsp->Buffer);
  5018	
  5019			if (!user_guest(sess->user))
  5020				memcpy(info->objid, user_passkey(sess->user), 16);
  5021			else
  5022				memset(info->objid, 0, 16);
  5023	
  5024			info->extended_info.magic = cpu_to_le32(EXTENDED_INFO_MAGIC);
  5025			info->extended_info.version = cpu_to_le32(1);
  5026			info->extended_info.release = cpu_to_le32(1);
  5027			info->extended_info.rel_date = 0;
  5028			memcpy(info->extended_info.version_string, "1.1.0", strlen("1.1.0"));
  5029			rsp->OutputBufferLength = cpu_to_le32(64);
  5030			inc_rfc1001_len(work->response_buf, 64);
  5031			fs_infoclass_size = FS_OBJECT_ID_INFORMATION_SIZE;
  5032			break;
  5033		}
  5034		case FS_SECTOR_SIZE_INFORMATION:
  5035		{
  5036			struct smb3_fs_ss_info *info;
  5037			unsigned int sector_size =
  5038				min_t(unsigned int, path.mnt->mnt_sb->s_blocksize, 4096);
  5039	
  5040			info = (struct smb3_fs_ss_info *)(rsp->Buffer);
  5041	
  5042			info->LogicalBytesPerSector = cpu_to_le32(sector_size);
  5043			info->PhysicalBytesPerSectorForAtomicity =
  5044					cpu_to_le32(sector_size);
  5045			info->PhysicalBytesPerSectorForPerf = cpu_to_le32(sector_size);
  5046			info->FSEffPhysicalBytesPerSectorForAtomicity =
  5047					cpu_to_le32(sector_size);
  5048			info->Flags = cpu_to_le32(SSINFO_FLAGS_ALIGNED_DEVICE |
  5049					    SSINFO_FLAGS_PARTITION_ALIGNED_ON_DEVICE);
  5050			info->ByteOffsetForSectorAlignment = 0;
  5051			info->ByteOffsetForPartitionAlignment = 0;
  5052			rsp->OutputBufferLength = cpu_to_le32(28);
  5053			inc_rfc1001_len(work->response_buf, 28);
  5054			fs_infoclass_size = FS_SECTOR_SIZE_INFORMATION_SIZE;
  5055			break;
  5056		}
  5057		case FS_CONTROL_INFORMATION:
  5058		{
  5059			/*
  5060			 * TODO : The current implementation is based on
  5061			 * test result with win7(NTFS) server. It's need to
  5062			 * modify this to get valid Quota values
  5063			 * from Linux kernel
  5064			 */
  5065			struct smb2_fs_control_info *info;
  5066	
  5067			info = (struct smb2_fs_control_info *)(rsp->Buffer);
  5068			info->FreeSpaceStartFiltering = 0;
  5069			info->FreeSpaceThreshold = 0;
  5070			info->FreeSpaceStopFiltering = 0;
  5071			info->DefaultQuotaThreshold = cpu_to_le64(SMB2_NO_FID);
  5072			info->DefaultQuotaLimit = cpu_to_le64(SMB2_NO_FID);
  5073			info->Padding = 0;
  5074			rsp->OutputBufferLength = cpu_to_le32(48);
  5075			inc_rfc1001_len(work->response_buf, 48);
  5076			fs_infoclass_size = FS_CONTROL_INFORMATION_SIZE;
  5077			break;
  5078		}
  5079		case FS_POSIX_INFORMATION:
  5080		{
  5081			struct filesystem_posix_info *info;
  5082	
  5083			if (!work->tcon->posix_extensions) {
  5084				pr_err("client doesn't negotiate with SMB3.1.1 POSIX Extensions\n");
  5085				rc = -EOPNOTSUPP;
  5086			} else {
  5087				info = (struct filesystem_posix_info *)(rsp->Buffer);
  5088				info->OptimalTransferSize = cpu_to_le32(stfs.f_bsize);
  5089				info->BlockSize = cpu_to_le32(stfs.f_bsize);
  5090				info->TotalBlocks = cpu_to_le64(stfs.f_blocks);
  5091				info->BlocksAvail = cpu_to_le64(stfs.f_bfree);
  5092				info->UserBlocksAvail = cpu_to_le64(stfs.f_bavail);
  5093				info->TotalFileNodes = cpu_to_le64(stfs.f_files);
  5094				info->FreeFileNodes = cpu_to_le64(stfs.f_ffree);
  5095				rsp->OutputBufferLength = cpu_to_le32(56);
  5096				inc_rfc1001_len(work->response_buf, 56);
  5097				fs_infoclass_size = FS_POSIX_INFORMATION_SIZE;
  5098			}
  5099			break;
  5100		}
  5101		default:
  5102			path_put(&path);
  5103			return -EOPNOTSUPP;
  5104		}
  5105		rc = buffer_check_err(le32_to_cpu(req->OutputBufferLength),
  5106				      rsp, work->response_buf,
  5107				      fs_infoclass_size);
  5108		path_put(&path);
  5109		return rc;
  5110	}
  5111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
