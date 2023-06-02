Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9251623B0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685697864; x=1717233864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J1rr9kgE7T7z6tOFGuebUS/FnYNUnTOipSw43gUCNu4=;
  b=HlexES0ujK5eweZMK/mjdM19eeWPqENhFTcNUzqHboV70SG44mGCvBnE
   vHNVArdpkGEi2WmbsVtYQhWUfYaiRW3XrxSwC1sZ1nkxJj+37o/eQGEjL
   uf85l1g0AyspTLRakUKegRqXeqQ8nLxsrE5NPPvTDE2QnnYDl/Cy3I4ac
   dyzbqGsvcUlFgvejQP049+DjdRGO9TPGoeBkC9NpKoVW828fPy3Jw+WuB
   8JvBgi69AJoWBVRFe6SuLzW9Vv193S53XuKL3YG92uHggp4PMUcdOGSfb
   NikVoDmwdqTKyRdgtaBIgEiycMeKwFmOlcdEv9UuY6IHLNLjIJNQr8Re6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340455339"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="340455339"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 02:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="710889350"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="710889350"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2023 02:24:22 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q511B-0000Hp-0f;
	Fri, 02 Jun 2023 09:24:21 +0000
Date: Fri, 2 Jun 2023 17:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl-qtg 16/26] lib/fw_table.c:30:1: error: expected '=',
 ',', ';', 'asm' or '__attribute__' before 'acpi_get_entry_type'
Message-ID: <202306021733.Pus9Lyk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   d149ac9ae1abedde6933ea16e12a44b965bb1384
commit: 5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a [16/26] cxl: Add callback to parse the DSMAS subtables from CDAT
config: arm64-randconfig-r016-20230601 (https://download.01.org/0day-ci/archive/20230602/202306021733.Pus9Lyk8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 5d09ce6212f35827d5ca6c271d70ac8bb9b5eb8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021733.Pus9Lyk8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> lib/fw_table.c:30:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_get_entry_type'
      30 | acpi_get_entry_type(struct acpi_subtable_entry *entry)
         | ^~~~~~~~~~~~~~~~~~~
>> lib/fw_table.c:48:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_get_entry_length'
      48 | acpi_get_entry_length(struct acpi_subtable_entry *entry)
         | ^~~~~~~~~~~~~~~~~~~~~
>> lib/fw_table.c:68:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_get_subtable_header_length'
      68 | acpi_get_subtable_header_length(struct acpi_subtable_entry *entry)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/fw_table.c:86:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_get_subtable_type'
      86 | acpi_get_subtable_type(char *id)
         | ^~~~~~~~~~~~~~~~~~~~~~
>> lib/fw_table.c:100:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_table_get_length'
     100 | acpi_table_get_length(enum acpi_subtable_type type,
         | ^~~~~~~~~~~~~~~~~~~~~
>> lib/fw_table.c:112:8: error: unknown type name '__init_or_acpilib'
     112 | static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
         |        ^~~~~~~~~~~~~~~~~
>> lib/fw_table.c:112:31: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'has_handler'
     112 | static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
         |                               ^~~~~~~~~~~
>> lib/fw_table.c:117:25: error: expected ';' before 'int'
     117 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                         ^~~~
         |                         ;
>> lib/fw_table.c:117:30: warning: no previous prototype for 'call_handler' [-Wmissing-prototypes]
     117 | static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
         |                              ^~~~~~~~~~~~
>> lib/fw_table.c:152:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'acpi_parse_entries_array'
     152 | acpi_parse_entries_array(char *id, unsigned long table_size,
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +30 lib/fw_table.c

773808188a9583e Dave Jiang 2023-05-11   28  
773808188a9583e Dave Jiang 2023-05-11   29  static unsigned long __init_or_acpilib
773808188a9583e Dave Jiang 2023-05-11  @30  acpi_get_entry_type(struct acpi_subtable_entry *entry)
773808188a9583e Dave Jiang 2023-05-11   31  {
773808188a9583e Dave Jiang 2023-05-11   32  	switch (entry->type) {
773808188a9583e Dave Jiang 2023-05-11   33  	case ACPI_SUBTABLE_COMMON:
773808188a9583e Dave Jiang 2023-05-11   34  		return entry->hdr->common.type;
773808188a9583e Dave Jiang 2023-05-11   35  	case ACPI_SUBTABLE_HMAT:
773808188a9583e Dave Jiang 2023-05-11   36  		return entry->hdr->hmat.type;
773808188a9583e Dave Jiang 2023-05-11   37  	case ACPI_SUBTABLE_PRMT:
773808188a9583e Dave Jiang 2023-05-11   38  		return 0;
773808188a9583e Dave Jiang 2023-05-11   39  	case ACPI_SUBTABLE_CEDT:
773808188a9583e Dave Jiang 2023-05-11   40  		return entry->hdr->cedt.type;
a4f8e943725bf7b Dave Jiang 2023-05-24   41  	case CDAT_SUBTABLE:
a4f8e943725bf7b Dave Jiang 2023-05-24   42  		return entry->hdr->cdat.type;
773808188a9583e Dave Jiang 2023-05-11   43  	}
773808188a9583e Dave Jiang 2023-05-11   44  	return 0;
773808188a9583e Dave Jiang 2023-05-11   45  }
773808188a9583e Dave Jiang 2023-05-11   46  
773808188a9583e Dave Jiang 2023-05-11   47  static unsigned long __init_or_acpilib
773808188a9583e Dave Jiang 2023-05-11  @48  acpi_get_entry_length(struct acpi_subtable_entry *entry)
773808188a9583e Dave Jiang 2023-05-11   49  {
773808188a9583e Dave Jiang 2023-05-11   50  	switch (entry->type) {
773808188a9583e Dave Jiang 2023-05-11   51  	case ACPI_SUBTABLE_COMMON:
773808188a9583e Dave Jiang 2023-05-11   52  		return entry->hdr->common.length;
773808188a9583e Dave Jiang 2023-05-11   53  	case ACPI_SUBTABLE_HMAT:
773808188a9583e Dave Jiang 2023-05-11   54  		return entry->hdr->hmat.length;
773808188a9583e Dave Jiang 2023-05-11   55  	case ACPI_SUBTABLE_PRMT:
773808188a9583e Dave Jiang 2023-05-11   56  		return entry->hdr->prmt.length;
773808188a9583e Dave Jiang 2023-05-11   57  	case ACPI_SUBTABLE_CEDT:
773808188a9583e Dave Jiang 2023-05-11   58  		return entry->hdr->cedt.length;
a4f8e943725bf7b Dave Jiang 2023-05-24   59  	case CDAT_SUBTABLE:
a4f8e943725bf7b Dave Jiang 2023-05-24   60  		__le16 length = (__force __le16)entry->hdr->cdat.length;
a4f8e943725bf7b Dave Jiang 2023-05-24   61  
a4f8e943725bf7b Dave Jiang 2023-05-24   62  		return le16_to_cpu(length);
773808188a9583e Dave Jiang 2023-05-11   63  	}
773808188a9583e Dave Jiang 2023-05-11   64  	return 0;
773808188a9583e Dave Jiang 2023-05-11   65  }
773808188a9583e Dave Jiang 2023-05-11   66  
773808188a9583e Dave Jiang 2023-05-11   67  static unsigned long __init_or_acpilib
773808188a9583e Dave Jiang 2023-05-11  @68  acpi_get_subtable_header_length(struct acpi_subtable_entry *entry)
773808188a9583e Dave Jiang 2023-05-11   69  {
773808188a9583e Dave Jiang 2023-05-11   70  	switch (entry->type) {
773808188a9583e Dave Jiang 2023-05-11   71  	case ACPI_SUBTABLE_COMMON:
773808188a9583e Dave Jiang 2023-05-11   72  		return sizeof(entry->hdr->common);
773808188a9583e Dave Jiang 2023-05-11   73  	case ACPI_SUBTABLE_HMAT:
773808188a9583e Dave Jiang 2023-05-11   74  		return sizeof(entry->hdr->hmat);
773808188a9583e Dave Jiang 2023-05-11   75  	case ACPI_SUBTABLE_PRMT:
773808188a9583e Dave Jiang 2023-05-11   76  		return sizeof(entry->hdr->prmt);
773808188a9583e Dave Jiang 2023-05-11   77  	case ACPI_SUBTABLE_CEDT:
773808188a9583e Dave Jiang 2023-05-11   78  		return sizeof(entry->hdr->cedt);
a4f8e943725bf7b Dave Jiang 2023-05-24   79  	case CDAT_SUBTABLE:
a4f8e943725bf7b Dave Jiang 2023-05-24   80  		return sizeof(entry->hdr->cdat);
773808188a9583e Dave Jiang 2023-05-11   81  	}
773808188a9583e Dave Jiang 2023-05-11   82  	return 0;
773808188a9583e Dave Jiang 2023-05-11   83  }
773808188a9583e Dave Jiang 2023-05-11   84  
773808188a9583e Dave Jiang 2023-05-11   85  static enum acpi_subtable_type __init_or_acpilib
773808188a9583e Dave Jiang 2023-05-11  @86  acpi_get_subtable_type(char *id)
773808188a9583e Dave Jiang 2023-05-11   87  {
773808188a9583e Dave Jiang 2023-05-11   88  	if (strncmp(id, ACPI_SIG_HMAT, 4) == 0)
773808188a9583e Dave Jiang 2023-05-11   89  		return ACPI_SUBTABLE_HMAT;
773808188a9583e Dave Jiang 2023-05-11   90  	if (strncmp(id, ACPI_SIG_PRMT, 4) == 0)
773808188a9583e Dave Jiang 2023-05-11   91  		return ACPI_SUBTABLE_PRMT;
773808188a9583e Dave Jiang 2023-05-11   92  	if (strncmp(id, ACPI_SIG_CEDT, 4) == 0)
773808188a9583e Dave Jiang 2023-05-11   93  		return ACPI_SUBTABLE_CEDT;
a4f8e943725bf7b Dave Jiang 2023-05-24   94  	if (strncmp(id, ACPI_SIG_CDAT, 4) == 0)
a4f8e943725bf7b Dave Jiang 2023-05-24   95  		return CDAT_SUBTABLE;
773808188a9583e Dave Jiang 2023-05-11   96  	return ACPI_SUBTABLE_COMMON;
773808188a9583e Dave Jiang 2023-05-11   97  }
773808188a9583e Dave Jiang 2023-05-11   98  
a4f8e943725bf7b Dave Jiang 2023-05-24   99  static unsigned long __init_or_acpilib
a4f8e943725bf7b Dave Jiang 2023-05-24 @100  acpi_table_get_length(enum acpi_subtable_type type,
a4f8e943725bf7b Dave Jiang 2023-05-24  101  		      union fw_table_header *header)
a4f8e943725bf7b Dave Jiang 2023-05-24  102  {
a4f8e943725bf7b Dave Jiang 2023-05-24  103  	if (type == CDAT_SUBTABLE) {
a4f8e943725bf7b Dave Jiang 2023-05-24  104  		__le32 length = (__force __le32)header->cdat.length;
a4f8e943725bf7b Dave Jiang 2023-05-24  105  
a4f8e943725bf7b Dave Jiang 2023-05-24  106  		return le32_to_cpu(length);
a4f8e943725bf7b Dave Jiang 2023-05-24  107  	}
a4f8e943725bf7b Dave Jiang 2023-05-24  108  
a4f8e943725bf7b Dave Jiang 2023-05-24  109  	return header->acpi.length;
a4f8e943725bf7b Dave Jiang 2023-05-24  110  }
a4f8e943725bf7b Dave Jiang 2023-05-24  111  
773808188a9583e Dave Jiang 2023-05-11 @112  static __init_or_acpilib bool has_handler(struct acpi_subtable_proc *proc)
773808188a9583e Dave Jiang 2023-05-11  113  {
773808188a9583e Dave Jiang 2023-05-11  114  	return proc->handler || proc->handler_arg;
773808188a9583e Dave Jiang 2023-05-11  115  }
773808188a9583e Dave Jiang 2023-05-11  116  
773808188a9583e Dave Jiang 2023-05-11 @117  static __init_or_acpilib int call_handler(struct acpi_subtable_proc *proc,
773808188a9583e Dave Jiang 2023-05-11  118  					  union acpi_subtable_headers *hdr,
773808188a9583e Dave Jiang 2023-05-11  119  					  unsigned long end)
773808188a9583e Dave Jiang 2023-05-11  120  {
773808188a9583e Dave Jiang 2023-05-11  121  	if (proc->handler)
773808188a9583e Dave Jiang 2023-05-11  122  		return proc->handler(hdr, end);
773808188a9583e Dave Jiang 2023-05-11  123  	if (proc->handler_arg)
773808188a9583e Dave Jiang 2023-05-11  124  		return proc->handler_arg(hdr, proc->arg, end);
773808188a9583e Dave Jiang 2023-05-11  125  	return -EINVAL;
773808188a9583e Dave Jiang 2023-05-11  126  }
773808188a9583e Dave Jiang 2023-05-11  127  
773808188a9583e Dave Jiang 2023-05-11  128  /**
773808188a9583e Dave Jiang 2023-05-11  129   * acpi_parse_entries_array - for each proc_num find a suitable subtable
773808188a9583e Dave Jiang 2023-05-11  130   *
773808188a9583e Dave Jiang 2023-05-11  131   * @id: table id (for debugging purposes)
773808188a9583e Dave Jiang 2023-05-11  132   * @table_size: size of the root table
773808188a9583e Dave Jiang 2023-05-11  133   * @table_header: where does the table start?
773808188a9583e Dave Jiang 2023-05-11  134   * @proc: array of acpi_subtable_proc struct containing entry id
773808188a9583e Dave Jiang 2023-05-11  135   *        and associated handler with it
773808188a9583e Dave Jiang 2023-05-11  136   * @proc_num: how big proc is?
773808188a9583e Dave Jiang 2023-05-11  137   * @max_entries: how many entries can we process?
773808188a9583e Dave Jiang 2023-05-11  138   *
773808188a9583e Dave Jiang 2023-05-11  139   * For each proc_num find a subtable with proc->id and run proc->handler
773808188a9583e Dave Jiang 2023-05-11  140   * on it. Assumption is that there's only single handler for particular
773808188a9583e Dave Jiang 2023-05-11  141   * entry id.
773808188a9583e Dave Jiang 2023-05-11  142   *
773808188a9583e Dave Jiang 2023-05-11  143   * The table_size is not the size of the complete ACPI table (the length
773808188a9583e Dave Jiang 2023-05-11  144   * field in the header struct), but only the size of the root table; i.e.,
773808188a9583e Dave Jiang 2023-05-11  145   * the offset from the very first byte of the complete ACPI table, to the
773808188a9583e Dave Jiang 2023-05-11  146   * first byte of the very first subtable.
773808188a9583e Dave Jiang 2023-05-11  147   *
773808188a9583e Dave Jiang 2023-05-11  148   * On success returns sum of all matching entries for all proc handlers.
773808188a9583e Dave Jiang 2023-05-11  149   * Otherwise, -ENODEV or -EINVAL is returned.
773808188a9583e Dave Jiang 2023-05-11  150   */
773808188a9583e Dave Jiang 2023-05-11  151  int __init_or_acpilib
773808188a9583e Dave Jiang 2023-05-11 @152  acpi_parse_entries_array(char *id, unsigned long table_size,
a4f8e943725bf7b Dave Jiang 2023-05-24  153  			 union fw_table_header *table_header,
773808188a9583e Dave Jiang 2023-05-11  154  			 struct acpi_subtable_proc *proc,
773808188a9583e Dave Jiang 2023-05-11  155  			 int proc_num, unsigned int max_entries)
773808188a9583e Dave Jiang 2023-05-11  156  {
773808188a9583e Dave Jiang 2023-05-11  157  	unsigned long table_end, subtable_len, entry_len;
773808188a9583e Dave Jiang 2023-05-11  158  	struct acpi_subtable_entry entry;
a4f8e943725bf7b Dave Jiang 2023-05-24  159  	enum acpi_subtable_type type;
773808188a9583e Dave Jiang 2023-05-11  160  	int count = 0;
773808188a9583e Dave Jiang 2023-05-11  161  	int errs = 0;
773808188a9583e Dave Jiang 2023-05-11  162  	int i;
773808188a9583e Dave Jiang 2023-05-11  163  
a4f8e943725bf7b Dave Jiang 2023-05-24  164  	type = acpi_get_subtable_type(id);
a4f8e943725bf7b Dave Jiang 2023-05-24  165  	table_end = (unsigned long)table_header +
a4f8e943725bf7b Dave Jiang 2023-05-24  166  		    acpi_table_get_length(type, table_header);
773808188a9583e Dave Jiang 2023-05-11  167  
773808188a9583e Dave Jiang 2023-05-11  168  	/* Parse all entries looking for a match. */
773808188a9583e Dave Jiang 2023-05-11  169  
a4f8e943725bf7b Dave Jiang 2023-05-24  170  	entry.type = type;
773808188a9583e Dave Jiang 2023-05-11  171  	entry.hdr = (union acpi_subtable_headers *)
773808188a9583e Dave Jiang 2023-05-11  172  	    ((unsigned long)table_header + table_size);
773808188a9583e Dave Jiang 2023-05-11  173  	subtable_len = acpi_get_subtable_header_length(&entry);
773808188a9583e Dave Jiang 2023-05-11  174  
773808188a9583e Dave Jiang 2023-05-11  175  	while (((unsigned long)entry.hdr) + subtable_len  < table_end) {
773808188a9583e Dave Jiang 2023-05-11  176  		if (max_entries && count >= max_entries)
773808188a9583e Dave Jiang 2023-05-11  177  			break;
773808188a9583e Dave Jiang 2023-05-11  178  
773808188a9583e Dave Jiang 2023-05-11  179  		for (i = 0; i < proc_num; i++) {
773808188a9583e Dave Jiang 2023-05-11  180  			if (acpi_get_entry_type(&entry) != proc[i].id)
773808188a9583e Dave Jiang 2023-05-11  181  				continue;
773808188a9583e Dave Jiang 2023-05-11  182  			if (!has_handler(&proc[i]) ||
773808188a9583e Dave Jiang 2023-05-11  183  			    (!errs &&
773808188a9583e Dave Jiang 2023-05-11  184  			     call_handler(&proc[i], entry.hdr, table_end))) {
773808188a9583e Dave Jiang 2023-05-11  185  				errs++;
773808188a9583e Dave Jiang 2023-05-11  186  				continue;
773808188a9583e Dave Jiang 2023-05-11  187  			}
773808188a9583e Dave Jiang 2023-05-11  188  
773808188a9583e Dave Jiang 2023-05-11  189  			proc[i].count++;
773808188a9583e Dave Jiang 2023-05-11  190  			break;
773808188a9583e Dave Jiang 2023-05-11  191  		}
773808188a9583e Dave Jiang 2023-05-11  192  		if (i != proc_num)
773808188a9583e Dave Jiang 2023-05-11  193  			count++;
773808188a9583e Dave Jiang 2023-05-11  194  
773808188a9583e Dave Jiang 2023-05-11  195  		/*
773808188a9583e Dave Jiang 2023-05-11  196  		 * If entry->length is 0, break from this loop to avoid
773808188a9583e Dave Jiang 2023-05-11  197  		 * infinite loop.
773808188a9583e Dave Jiang 2023-05-11  198  		 */
773808188a9583e Dave Jiang 2023-05-11  199  		entry_len = acpi_get_entry_length(&entry);
773808188a9583e Dave Jiang 2023-05-11  200  		if (entry_len == 0) {
773808188a9583e Dave Jiang 2023-05-11  201  			pr_err("[%4.4s:0x%02x] Invalid zero length\n", id, proc->id);
773808188a9583e Dave Jiang 2023-05-11  202  			return -EINVAL;
773808188a9583e Dave Jiang 2023-05-11  203  		}
773808188a9583e Dave Jiang 2023-05-11  204  
773808188a9583e Dave Jiang 2023-05-11  205  		entry.hdr = (union acpi_subtable_headers *)
773808188a9583e Dave Jiang 2023-05-11  206  		    ((unsigned long)entry.hdr + entry_len);
773808188a9583e Dave Jiang 2023-05-11  207  	}
773808188a9583e Dave Jiang 2023-05-11  208  
773808188a9583e Dave Jiang 2023-05-11  209  	if (max_entries && count > max_entries) {
773808188a9583e Dave Jiang 2023-05-11  210  		pr_warn("[%4.4s:0x%02x] found the maximum %i entries\n",
773808188a9583e Dave Jiang 2023-05-11  211  			id, proc->id, count);
773808188a9583e Dave Jiang 2023-05-11  212  	}
773808188a9583e Dave Jiang 2023-05-11  213  
773808188a9583e Dave Jiang 2023-05-11  214  	return errs ? -EINVAL : count;
773808188a9583e Dave Jiang 2023-05-11  215  }
773808188a9583e Dave Jiang 2023-05-11  216  EXPORT_SYMBOL_GPL(acpi_parse_entries_array);
a4f8e943725bf7b Dave Jiang 2023-05-24  217  

:::::: The code at line 30 was first introduced by commit
:::::: 773808188a9583e1e972862094c60a6ddc70f748 acpi: Move common tables helper functions to common lib

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Dave Jiang <dave.jiang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
